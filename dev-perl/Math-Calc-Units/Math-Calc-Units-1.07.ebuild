# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

S=${WORKDIR}/${P}
DESCRIPTION="Human-readable unit-aware calculator"
SRC_URI="http://search.cpan.org/CPAN/authors/id/S/SF/SFINK/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/CPAN/authors/id/S/SF/SFINK/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"
