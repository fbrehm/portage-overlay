# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

RESTRICT="nomirror"

S=${WORKDIR}/${P}
DESCRIPTION="this library is a simple binding between Perl and any library that complies with the OpenGL API"
SRC_URI="http://www.cpan.org/modules/by-module/${PN}/${P}.tar.gz"
HOMEPAGE="http://www.cpan.org/modules/by-module/${PN}/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"


