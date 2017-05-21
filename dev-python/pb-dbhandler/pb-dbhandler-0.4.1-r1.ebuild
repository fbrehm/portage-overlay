# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4,3_5} pypy2_0 )

DESCRIPTION="Python modules for common used classes for access to databases, escpecially to PostrgreSQL."
HOMEPAGE="https://github.com/fbrehm/py_pb_dbhandler"
SRC_URI="https://github.com/fbrehm/py_pb_dbhandler/archive/${PV}-1.tar.gz -> ${P}.tar.gz"

inherit distutils-r1 user

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc nls"

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

S="${WORKDIR}/py_pb_dbhandler-${PV}-1"

pkg_setup() {

	einfo "Start setup package ..."
	distutils-r1_src_prepare
}

src_compile() {
	einfo "Start compiling package ..."
	distutils-r1_src_compile
	if use nls; then
		make -C ${S}/po
	fi
}

src_install() {
	einfo "Start installing package ..."
	distutils-r1_src_install

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


# vim: filetype=ebuild ts=4 sw=4
