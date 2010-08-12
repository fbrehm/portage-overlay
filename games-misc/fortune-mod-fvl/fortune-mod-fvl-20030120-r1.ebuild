# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod-fvl/fortune-mod-fvl-20030120.ebuild,v 1.11 2006/07/19 19:48:35 flameeyes Exp $

DESCRIPTION="Quotes from Felix von Leitner (fefe)"
HOMEPAGE="http://fortune-mod-fvl.sourceforge.net/"
SRC_URI="mirror://sourceforge/fortune-mod-fvl/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="unicode"

RDEPEND="games-misc/fortune-mod"
DEPEND="${RDEPEND}
    unicode? ( virtual/libiconv )"

src_compile() {
	cd ${S}
	if use unicode ; then
		for f in fvl fvl_vendor; do
			iconv --from-code latin1 --to-code utf8 -o${f}.utf8 ${f}
			mv ${f}.utf8 ${f}
		done
	fi
	for f in fvl fvl_vendor; do
		rm -f ${f}.dat
		strfile -s ${f}
	done
}

src_install() {
	insinto /usr/share/fortune/de
	doins fvl fvl.dat fvl_vendor fvl_vendor.dat || die
	dodoc ChangeLog README
	if use unicode ; then
		cd ${S}
		# Create file with extension *.u8 to give fortune binary a hint to this encoding
		for f in fvl fvl_vendor; do
			dosym ${f} /usr/share/fortune/de/${f}.u8
		done
	fi
}
