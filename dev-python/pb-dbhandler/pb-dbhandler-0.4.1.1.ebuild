# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Python modules for common used classes for access to databases, escpecially to PostrgreSQL."
HOMEPAGE="https://github.com/fbrehm/py_pb_dbhandler"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/py_pb_dbhandler.git"

inherit git-2 distutils user python versionator

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc nls"
PYTHON_DEPEND="2::2.7"

EGIT_BRANCH="master"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

RDEPEND="
	dev-python/psycopg
	>=dev-python/pb-base-0.3.10
	nls? ( virtual/libintl )
"
DEPEND="
	${RDEPEND}
	doc? (	dev-python/epydoc 
			dev-python/docutils
			dev-texlive/texlive-latexextra
	)
	nls? ( sys-devel/gettext )
"

pkg_setup() {

	elog "Used GIT tag: '${EGIT_COMMIT}'."

	python_set_active_version 2
	python_pkg_setup
}

src_install() {
	distutils_src_install
	#python_clean_installation_image

	if use doc; then
		einfo "Installing documentation ..."
		dodir "/usr/share/doc/${PF}"
		dodir "/usr/share/doc/${PF}/html"
		dodir "/usr/share/doc/${PF}/pdf"

		einfo "Creating epydoc html documentation"
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/src/pb_dbhandler" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/src/pb_dbhandler" || ewarn "Could not create epydoc pdf documentation"

	fi

	if use nls; then
		(cd "${S}/po" && make DESTDIR="${ED}" install)
	fi

}

pkg_postinst() {
	python_mod_optimize pb_base
}

pkg_postrm () {
    python_mod_cleanup pb_base
}


