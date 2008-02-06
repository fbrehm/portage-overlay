# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

MY_P="VMware-VIPerl-Toolkit-${PV}-source"
S=${WORKDIR}/viperltoolkit

DESCRIPTION="The VI Perl Toolkit provides an easy-to-use Perl scripting interface to the VMware Infrastructure API (VI API)."
HOMEPAGE="http://www.vmware.com/support/developer/viperltoolkit/"
SRC_URI="${MY_P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RESTRICT="fetch"

DEPEND="dev-lang/perl
        >=dev-perl/Crypt-SSLeay-0.51
        >=dev-perl/Class-MethodMaker-2.08
        >=dev-perl/XML-LibXML-1.58
        >=dev-perl/libwww-perl-5.8.05"

pkg_nofetch() {
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "select Download below \"VI Perl Toolkit 1.5\" and download the package ${MY_P}.tar.gz"
	eerror "Then after downloading put them in:"
	eerror "  ${DISTDIR}"
}


