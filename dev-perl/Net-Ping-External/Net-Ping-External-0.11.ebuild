# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="Cross-platform interface to ICMP 'ping' utilities"
SRC_URI="http://www.cpan.org/modules/by-module/Net/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/Net/${P}.readme"

RESTRICT=mirror

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc sparc ~alpha"
