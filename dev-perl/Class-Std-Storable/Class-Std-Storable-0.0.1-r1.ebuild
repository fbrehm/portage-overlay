# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
MODULE_AUTHOR=LMAYER
inherit perl-module eutils

S=${WORKDIR}/${PN}-v${PV}
DESCRIPTION="Class::Std::Storable: An 'inside-out' class builder based on Class::Std that adds the ability to serialize the objects."
SRC_URI="http://cpan.pair.com/modules/by-module/${P%%-*}/${PN}-v${PV}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.readme"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND=">=dev-perl/Class-Std-0.0.4
perl-core/Test-Simple
virtual/perl-version
perl-core/Scalar-List-Utils
"

