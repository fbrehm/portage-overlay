# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

DESCRIPTION="An aquarium/sea animation in ASCII art."
HOMEPAGE="http://www.robobunny.com/projects/asciiquarium/html"
SRC_URI="http://www.robobunny.com/projects/asciiquarium/${PN}_${PV}.tar.gz"

RESTRICT="nomirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=">=dev-perl/Term-Animation-2.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}_${PV}"

src_compile() {
	einfo "Nothing to compile here."
}

src_install() {
	install -D --preserve-timestamps asciiquarium "${D}${GAMES_BINDIR}/asciiquarium"
	dodoc CHANGES MANIFEST README gpl.txt
	prepgamesdirs
}

