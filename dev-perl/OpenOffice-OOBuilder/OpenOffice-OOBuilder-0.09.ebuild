# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit perl-module

DESCRIPTION="A collection of modules to create OpenOffice documents"
SRC_URI="http://search.cpan.org/CPAN/authors/id/M/MA/MAYGILL/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~maygill/OpenOffice-OOBuilder-0.09/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"
RESTRICT="nomirror"
DEPEND="dev-perl/Archive-Zip"

IUSE=" examples "

src_install() {

	emake install DESTDIR="${D}" || die

	if use examples ; then
		exeinto /usr/share/doc/${PF}/examples
		insinto /usr/share/doc/${PF}/examples
		for f in examples/* ; do
			doexe ${f}
		done
	fi

	dodoc Changes MANIFEST README TODO

}

