# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="Cross-platform interface to ICMP 'ping' utilities"
SRC_URI="http://www.cpan.org/modules/by-module/Net/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/src/CHORNY/Net-Ping-External-0.12/README"

RESTRICT=mirror

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc sparc ~alpha"
