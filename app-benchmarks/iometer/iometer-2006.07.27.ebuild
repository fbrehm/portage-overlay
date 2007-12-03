# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${PN}-${PV//./_}
S=${WORKDIR}/${MY_P}.common-src

DESCRIPTION="I/O subsystem measurement and characterization tool for single and clustered systems"
HOMEPAGE="http://www.iometer.org/"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/${PN}/${MY_P}.common-src.zip"

LICENSE="ipw3945"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	cd src || die "Directory 'src' in '`pwd`' not found."
	if [ ! -f Makefile-Linux.i386 ] ; then
		die "File 'Makefile-Linux.i386' not found."
	fi

	cp Makefile-Linux.i386 Makefile
	emake dynamo || die 
}

src_install() {

	dodoc CHANGELOG CREDITS DEVGUIDE LICENSE README
	docinto misc
	dodoc misc/graph.pl misc/Wizard.mdb
	docinto misc/Installer
	dodoc misc/Installer/*

	cd src || die "Directory 'src' in '`pwd`' not found."
	
	dobin dynamo

}

