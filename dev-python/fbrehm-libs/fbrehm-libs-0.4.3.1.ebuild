# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4
PYTHON_DEPEND="2:2.7"

EGIT_REPO_URI="https://github.com/fbrehm/py_fbrehm_libs.git"

RESTRICT="nomirror"

inherit git-2 distutils user python versionator

PYTHON_MODNAME="fbrehm/__init__.py fbrehm/common/__init__.py fbrehm/common/getopt.py fbrehm/common/logging_obj.py"

DESCRIPTION="A collection of common python modules by Frank Brehm"
HOMEPAGE="http://git.brehm-online.com/my-stuff/fbrehm.git"
SRC_URI=""

EGIT_BRANCH="develop"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc nls"

DEPEND=""
RDEPEND="
    dev-python/argparse
    dev-python/configobj
    nls? ( virtual/libintl )
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
        epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/src/fbrehm" || ewarn "Could not create epydoc html documentation"
        einfo "Creating epydoc pdf documentation"
        epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/src/fbrehm" || ewarn "Could not create epydoc pdf documentation"

    fi

    #if use nls; then
    #    (cd "${S}/po" && make DESTDIR="${ED}" install)
    #fi

}

pkg_postinst() {
    python_mod_optimize fbrehm
}

pkg_postrm () {
    python_mod_cleanup fbrehm
}

