# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4


DESCRIPTION="Python modules to extend the logging mechanism in Python."
HOMEPAGE="https://github.com/fbrehm/py_pb_logging"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/py_pb_logging.git"

inherit git-2 distutils user python versionator

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"
PYTHON_DEPEND="2::2.7"

EGIT_BRANCH="master"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

RDEPEND="
	virtual/python-argparse
"
DEPEND="
	${RDEPEND}
	doc? (	dev-python/epydoc 
			dev-python/docutils
			dev-texlive/texlive-latexextra
	)
"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."
	distutils_src_prepare
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
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/pb_logging" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/pb_logging" || ewarn "Could not create epydoc pdf documentation"

	fi

}

pkg_postinst() {
	python_mod_optimize pb_logging
}

pkg_postrm () {
    python_mod_cleanup pb_logging
}


