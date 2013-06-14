# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Python modules for common used wrapper classes for different block devices."
HOMEPAGE="https://github.com/fbrehm/py-pb-blockdev"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/py-pb-blockdev.git"

inherit git-2 distutils user python versionator

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc nls"
PYTHON_DEPEND="2::2.7"

EGIT_BRANCH="develop"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

RDEPEND="
	>=dev-python/pb-logging-0.2.7
	>=dev-python/pb-base-0.4.10
	>=dev-python/pyparted-3.8
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

	elog "Start setup package ..."
	python_set_active_version 2
	python_pkg_setup
}

src_compile() {
	elog "Start compiling package ..."
	distutils_src_compile
	if use nls; then
		make -C ${S}/po
	fi
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
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/pb_blockdev" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/pb_blockdev" || ewarn "Could not create epydoc pdf documentation"

	fi

#	if use nls; then
#		make -C ${S}/po DESTDIR="${ED}" install
#	fi

}

pkg_postinst() {
	python_mod_optimize pb_blockdev
}

pkg_postrm () {
    python_mod_cleanup pb_blockdev
}


