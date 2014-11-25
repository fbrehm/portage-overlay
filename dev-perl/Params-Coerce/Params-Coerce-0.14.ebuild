# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=ADAMK
MODULE_VERSION=0.14
inherit perl-module

DESCRIPTION="Allows your classes to do coercion of parameters"

RESTRICT="nomirror"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"

DEPEND="
	|| ( >=dev-lang/perl-5.8.1 >=perl-core/Scalar-List-Utils-1.11 )
	|| ( >=dev-lang/perl-5.8.1 >=perl-core/Test-Simple-0.47 )
	>=dev-perl/Params-Util-0.05
"
