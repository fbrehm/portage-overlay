# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

RESTRICT="nomirror"

inherit distutils

DESCRIPTION="A collection of common python modules by Frank Brehm"
HOMEPAGE="http://www.brehm-online.com/projects/"
SRC_URI="http://www.brehm-online.com/projects/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.txt debian/changelog"

