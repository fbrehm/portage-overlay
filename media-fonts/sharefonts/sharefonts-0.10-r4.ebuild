# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit font

DESCRIPTION="A Collection of Postscript Type1 Fonts"
SRC_URI="mirror://gimp/fonts/${P}.tar.gz"
HOMEPAGE="http://www.gimp.org/"
LICENSE="public-domain"

KEYWORDS="alpha amd64 arm ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""
SLOT="0"

FONT_S=${WORKDIR}/sharefont
S=${FONT_S}

FONT_SUFFIX="pfb"

DOCS="*.shareware"
