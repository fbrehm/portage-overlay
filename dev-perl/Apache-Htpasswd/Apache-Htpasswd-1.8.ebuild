# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

DESCRIPTION="Manage Unix crypt-style password file."
SRC_URI="http://search.cpan.org/CPAN/authors/id/K/KM/KMELTZ/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/src/KMELTZ/${P}/README"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
DEPEND=">=dev-perl/Digest-SHA1-2.0
perl-core/MIME-Base64
dev-perl/Crypt-PasswdMD5
"
