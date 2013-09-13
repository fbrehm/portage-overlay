# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Python modules for common used objects, error classes and functions."
HOMEPAGE="https://github.com/fbrehm/py_pb_base"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/py_pb_base.git"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit git-2 distutils-r1 user versionator

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc nls"
PYTHON_DEPEND="2::2.7"

EGIT_BRANCH="master"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

RDEPEND="
	virtual/python-argparse
	dev-python/configobj
	>=dev-python/pb-logging-0.2.7
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
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/pb_base" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/pb_base" || ewarn "Could not create epydoc pdf documentation"

	fi

	if use nls; then
		make -C ${S}/po DESTDIR="${ED}" install
	fi

}

pkg_postinst() {
	python_mod_optimize pb_base
}

pkg_postrm () {
    python_mod_cleanup pb_base
}


