# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

S=${WORKDIR}/${P}
DESCRIPTION="Sys::Proctitle - modify proctitle on Linux"
SRC_URI="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.readme"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="dev-perl/Class-Member"
