# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy2_0 )

DESCRIPTION="Python modules to extend the logging mechanism in Python."
HOMEPAGE="https://github.com/fbrehm/py_pb_logging"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/py_pb_logging.git"

inherit git-2 distutils-r1 user versionator

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

EGIT_BRANCH="master"
EGIT_COMMIT="$(replace_version_separator 3 '-')"

DOCS="debian/changelog README.txt"

RDEPEND="
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools
	doc? (	dev-python/epydoc
			dev-python/docutils
	)
"

src_prepare() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."
	distutils-r1_src_prepare
}

src_install() {

	distutils-r1_src_install

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

# vim: filetype=ebuild ts=4 sw=4
