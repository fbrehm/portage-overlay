# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/ctemplate/ctemplate-0.90.ebuild,v 1.2 2008/09/17 11:59:42 ulm Exp $

inherit elisp-common eutils

DESCRIPTION="A simple but powerful template language for C++"
HOMEPAGE="http://code.google.com/p/google-ctemplate/"
SRC_URI="http://google-ctemplate.googlecode.com/files/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vim-syntax"

DEPEND=""
RDEPEND="vim-syntax? ( >=app-editors/vim-core-7 )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	#epatch "${FILESDIR}/${PV}-missing_includes.patch"
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	# Installs just every piece
	rm -rf "${D}/usr/share/doc"

	dodoc AUTHORS ChangeLog NEWS README
	dohtml doc/*

	if use vim-syntax ; then
		cd "${S}/contrib"
		sh highlighting.vim || die "unpacking vim scripts failed"
		insinto /usr/share/vim/vimfiles
		doins -r .vim/*
	fi

}

