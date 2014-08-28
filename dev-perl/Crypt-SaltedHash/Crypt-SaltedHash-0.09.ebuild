# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

MODULE_AUTHOR=GSHANK
MODULE_VERSION=0.09
inherit perl-module

DESCRIPTION="Crypt::SaltedHash - Perl interface to functions that assist in working with salted hashes"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="perl-core/digest-base"

IUSE="test"

RDEPEND="
	virtual/perl-Digest
"

DEPEND="
	${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		dev-perl/Test-Fatal
		virtual/perl-Test-Simple
	)"

SRC_TEST="do"
