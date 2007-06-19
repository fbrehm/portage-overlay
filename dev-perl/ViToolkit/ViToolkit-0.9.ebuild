# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

MY_P=viperltoolkit-${PV}
S=${WORKDIR}/viperltoolkit

DESCRIPTION="VIPerlToolkit"
HOMEPAGE="http://sourceforge.net/projects/viperltoolkit/"
SRC_URI="http://dfn.dl.sourceforge.net/sourceforge/viperltoolkit/viperltoolkit-beta1.tgz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/perl
        >=dev-perl/Crypt-SSLeay-0.51
        >=dev-perl/Class-MethodMaker-2.08
        >=dev-perl/XML-LibXML-1.58
        >=dev-perl/libwww-perl-5.8.05"

