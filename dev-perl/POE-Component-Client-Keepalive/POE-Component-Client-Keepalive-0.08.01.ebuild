# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

MY_P=`echo "$P" | sed 's/\.\(..\)$/\1/'`
S=${WORKDIR}/${MY_P}
DESCRIPTION="Manages and keeps alive client connections"
SRC_URI="http://cpan.perl.org/modules/by-module/POE/${MY_P}.tar.gz"
HOMEPAGE="http://cpan.perl.org/modules/by-module/POE/${MY_P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND=">=dev-perl/POE-0.31
>=dev-perl/POE-Component-Client-DNS-0.98.01
"
