# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="Simplified source filtering"
SRC_URI="http://cpan.pair.com/modules/by-module/Filter/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/Filter/${PN}-0.80.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"
