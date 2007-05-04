# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="A module to encode / decode Unicode strings into Punycode, an efficient encoding of Unicode for use with IDNA."
SRC_URI="http://www.cpan.org/authors/id/M/MI/MIYAGAWA/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~miyagawa/IDNA-Punycode-0.02/lib/IDNA/Punycode.pm"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
