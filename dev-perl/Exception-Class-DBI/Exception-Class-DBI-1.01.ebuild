# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Exception-Class/Exception-Class-1.23.ebuild,v 1.11 2006/08/05 03:25:57 mcummings Exp $

EAPI=5
MODULE_AUTHOR=DWHEELER
inherit perl-module

DESCRIPTION="A set of DBI-specific exception classes for perl"
SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
RESTRICT="nomirror"

DEPEND="${DEPEND}
	>=dev-perl/DBI-1.30
    >=dev-perl/Exception-Class-1.02
	>=virtual/perl-Test-Simple-0.40"

