# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=MAYGILL
inherit perl-module

DESCRIPTION="A collection of modules to create OpenOffice documents"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"
RESTRICT="nomirror"
DEPEND="dev-perl/Archive-Zip"

IUSE=" examples "

src_install() {

	#emake install DESTDIR="${D}" || die
	perl-module_src_install

	if use examples ; then
		exeinto /usr/share/doc/${PF}/examples
		insinto /usr/share/doc/${PF}/examples
		for f in examples/* ; do
			doexe ${f}
		done
	fi

	dodoc Changes MANIFEST README TODO

}

