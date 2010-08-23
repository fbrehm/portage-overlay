# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=PMAKHOLM
inherit perl-module

DESCRIPTION="Encode::IMAPUTF7 - modification of UTF-7 encoding for IMAP"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"
RESTRICT="nomirror"

DEPEND="
	virtual/perl-Encode
	dev-perl/Test-NoWarnings
"
