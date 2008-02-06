# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

S=${WORKDIR}/${P}
DESCRIPTION="Perl extension for unparsed raw whois information"
SRC_URI="http://cpan.pair.com/modules/by-module/Net/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/Net/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"
