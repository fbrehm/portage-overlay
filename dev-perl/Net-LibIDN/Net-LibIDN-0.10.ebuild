# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="Perl bindings for GNU Libidn"
SRC_URI="http://search.cpan.org/CPAN/authors/id/T/TH/THOR/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~thor/Net-LibIDN-0.08/"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND=">=net-dns/libidn-0.3.5"

