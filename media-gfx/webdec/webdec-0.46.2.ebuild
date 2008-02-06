# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Extracts the JPEG images files from webshots .wbz,wbp and wbc files"
HOMEPAGE="http://www.jamesbarford.net/webdec.php"
SRC_URI="http://www.jamesbarford.net/downloads/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86"
IUSE=""
RESTRICT="nomirror"

DEPEND="virtual/libc"
RDEPEND="virtual/libc"

src_unpack() {
	unpack ${A} ; cd ${S}

	sed -i "s:-Wall:${CFLAGS}:" Makefile
}

src_compile() {
	emake || die
}

src_install() {
	dobin webdec || die
	dodoc GPL README
}


