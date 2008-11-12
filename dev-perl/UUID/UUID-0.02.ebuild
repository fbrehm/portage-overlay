# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

DESCRIPTION="Perl extension for using UUID interfaces as defined in e2fsprogs"
SRC_URI="http://search.cpan.org/CPAN/authors/id/C/CF/CFABER/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~cfaber/UUID/UUID.pm"

S=${WORKDIR}/${P}

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"

