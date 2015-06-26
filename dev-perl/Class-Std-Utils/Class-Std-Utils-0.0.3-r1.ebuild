# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
MODULE_AUTHOR=DMUEY
inherit perl-module

SRC_URI="http://cpan.pair.com/modules/by-module/Class/${PN}-v${PV}.tar.gz"
S=${WORKDIR}/${PN}-v${PV}
DESCRIPTION="Class::Std::Utils - simplify the creation of 'inside-out' classes"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="perl-core/Test-Simple
virtual/perl-version
perl-core/Scalar-List-Utils
"

