# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

DESCRIPTION="Class::Std - provides the standard infrastructure required to create 'inside-out' classes"
SRC_URI="http://cpan.pair.com/modules/by-module/${P%%-*}/${PN}-${PV}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.readme"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="perl-core/Test-Simple
virtual/perl-version
perl-core/Scalar-List-Utils
"

