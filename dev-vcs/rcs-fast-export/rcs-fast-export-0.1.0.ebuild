# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
RESTRICT="nomirror"

DESCRIPTION="Fast-export the RCS history (for git)"
HOMEPAGE="http://git.oblomov.eu/rcs-fast-export"
SRC_URI="http://git.oblomov.eu/rcs-fast-export/snapshot/e89bd46260fc2cf7647b1282c7b0c6d0092c6756.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/ruby"
RDEPEND="${DEPEND}"

S="${WORKDIR}/rcs-fast-export-e89bd46"

src_compile() {
	mv -v ${S}/rcs-fast-export.rb ${S}/rcs-fast-export
	sed -i -e 's/rcs-fast-export.rb/rcs-fast-export/g' ${S}/rcs-fast-export
}

src_install() {
	dobin rcs-fast-export
}
