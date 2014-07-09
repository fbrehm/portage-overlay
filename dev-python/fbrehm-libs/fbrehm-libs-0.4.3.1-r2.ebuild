# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2} pypy2_0 )

EGIT_REPO_URI="https://github.com/fbrehm/py_fbrehm_libs.git"

RESTRICT="nomirror"

inherit git-2 distutils-r1 user versionator

DESCRIPTION="A collection of common python modules by Frank Brehm"
HOMEPAGE="http://git.brehm-online.com/my-stuff/fbrehm.git"
SRC_URI=""

EGIT_BRANCH="develop"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc nls"

DEPEND=""
RDEPEND="
    dev-python/configobj
    nls? ( virtual/libintl )
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
        epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/src/fbrehm" || ewarn "Could not create epydoc html documentation"
        einfo "Creating epydoc pdf documentation"
        epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/src/fbrehm" || ewarn "Could not create epydoc pdf documentation"

    fi

    #if use nls; then
    #    (cd "${S}/po" && make DESTDIR="${ED}" install)
    #fi

}

