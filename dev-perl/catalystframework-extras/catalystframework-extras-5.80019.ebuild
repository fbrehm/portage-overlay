# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="Meta package for catalystframework and many useful extras"
HOMEPAGE="http://www.catalystframework.org/"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 ppc-macos s390 sh sparc x86"

S=${WORKDIR}

IUSE="sqlite"
DEPEND="
	=dev-perl/Catalyst-Runtime-5.80019
	dev-perl/Catalyst-Controller-BindLex
	dev-perl/Catalyst-Controller-FormBuilder
	dev-perl/Catalyst-Model-DBIC
	dev-perl/Catalyst-Model-DBIC-Plain
	dev-perl/Catalyst-Model-File
	dev-perl/Catalyst-Model-CDBI
	sqlite? ( dev-perl/Class-DBI-SQLite )
	dev-perl/Catalyst-View-Mason
	dev-perl/Catalyst-View-JSON
	dev-perl/Catalyst-View-GD-Barcode
	dev-perl/Catalyst-Plugin-Compress-Zlib
	dev-perl/Catalyst-Plugin-Unicode
	dev-perl/Catalyst-Plugin-Session-Store-FastMmap
	dev-perl/Catalyst-Plugin-Session-Store-DBIC
	dev-perl/Catalyst-Plugin-Session-PerUser
	dev-perl/Catalyst-Plugin-Authentication-Credential-CHAP
	dev-perl/Catalyst-Plugin-Email
	dev-perl/Catalyst-Plugin-FormValidator
	dev-perl/Catalyst-Plugin-FormValidator-Simple
	dev-perl/Catalyst-Plugin-FillInForm
	dev-perl/Catalyst-Plugin-Scheduler
	dev-perl/Catalyst-Plugin-Message
	dev-perl/Catalyst-Plugin-Dumper
	dev-perl/Catalyst-Plugin-UploadProgress
	dev-perl/Catalyst-Plugin-MortalForward
	dev-perl/Catalyst-Plugin-Images
	dev-perl/DBIx-Class-DigestColumns
	dev-perl/Template-Plugin-Class
"
