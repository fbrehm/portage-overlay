# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR="KBAUCOM"
inherit perl-module

DESCRIPTION="A framework to produce sprite animations using ASCII art."

RESTRICT="nomirror"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
LICENSE="Artistic"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND=">=dev-perl/Curses-1.06"
DEPEND="${RDEPEND}"

SRC_TEST="do"
