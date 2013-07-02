# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Python modules streamline writing Nagios plugins."
HOMEPAGE="http://git.profitbricks.localdomain/gitweb/?p=python/nagios-plugin;a=summary"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fbrehm/nagios-plugin.git"

inherit git-2 distutils user python versionator

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
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
	)
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
		epydoc --html -v -o "${ED}/usr/share/doc/${PF}/html" "${S}/nagios" || ewarn "Could not create epydoc html documentation"
		einfo "Creating epydoc pdf documentation"
		epydoc --pdf -o "${ED}/usr/share/doc/${PF}/pdf" "${S}/nagios" || ewarn "Could not create epydoc pdf documentation"

	fi

}

pkg_postinst() {
	python_mod_optimize nagios
}

pkg_postrm () {
    python_mod_cleanup nagios
}

