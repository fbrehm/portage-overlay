# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit perl-module

DESCRIPTION="SNMP support for Perl 5"
SRC_URI="http://www.switch.ch/misc/leinen/snmp/perl/dist/${P}.tar.gz"
HOMEPAGE="http://www.switch.ch/misc/leinen/snmp/perl/"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="alpha amd64 ~ia64 ppc sparc x86"
IUSE=""
RESTRICT="nomirror"

mydoc="README.SNMP_util"

src_install() {

	perl-module_src_install
	dohtml *.html
}
