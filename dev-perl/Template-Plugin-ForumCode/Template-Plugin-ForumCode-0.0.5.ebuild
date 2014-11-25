# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

MODULE_AUTHOR=CHISEL
MODULE_VERSION=0.0.5
inherit perl-module eutils

DESCRIPTION="Template plugin for HTML::ForumCode, a BBCode-esque forum markup"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="
    >=dev-perl/Template-Toolkit-2.19
	virtual/perl-version
	>=virtual/perl-Test-Simple-0.72
"


