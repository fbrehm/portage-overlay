# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy2_0 )

DESCRIPTION="Python modules streamline writing Nagios plugins."
HOMEPAGE="http://git.profitbricks.localdomain/gitweb/?p=python/nagios-plugin;a=summary"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/nagios-plugin.git"

inherit git-2 distutils-r1 user versionator

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

EGIT_BRANCH="master"
EGIT_COMMIT=$(replace_version_separator 3 '-')

DOCS="debian/changelog README.txt"

RDEPEND=""
DEPEND="
	${RDEPEND}
	doc? (	dev-python/epydoc 
			dev-python/docutils
	)
"

pkg_setup() {
	elog "Used GIT tag: '${EGIT_COMMIT}'."

    einfo "Start setup package ..."
    distutils-r1_src_prepare

}

src_compile() {
    einfo "Start compiling package ..."
    distutils-r1_src_compile
}


src_install() {

	distutils-r1_src_install

    rm -rfv ${ED}/usr/lib*/nagios/
    rm -rfv ${ED}/usr/lib*/python*/site-packages/nagios/plugins/

    einfo "Installing debian/changelog and README.txt"
    dodoc debian/changelog
    dodoc README.txt


	if use doc; then
		einfo "Installing documentation ..."
		dodir "/usr/share/doc/${PF}"
		dodir "/usr/share/doc/${PF}/html"
		dodir "/usr/share/doc/${PF}/pdf"

		einfo "Creating epydoc html documentation"
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/nagios" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/nagios" || ewarn "Could not create epydoc pdf documentation"

	fi

}

# vim: filetype=ebuild ts=4 sw=4
