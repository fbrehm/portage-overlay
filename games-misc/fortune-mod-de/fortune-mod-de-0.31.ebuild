# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod-fvl/fortune-mod-fvl-20030120.ebuild,v 1.11 2006/07/19 19:48:35 flameeyes Exp $

S=${WORKDIR}/fortunes-de-${PV}

DESCRIPTION="German Quotes for fortune"
HOMEPAGE="http://packages.debian.org/source/lenny/fortunes-de/"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/f/fortunes-de/fortunes-de_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="unicode"

RDEPEND="games-misc/fortune-mod"
DEPEND="${RDEPEND}
    unicode? ( virtual/libiconv )"

S=${WORKDIR}/fortunes-de-${PV}

src_compile() {

	cd ${S}

	str_it() {

		base="$( basename $1 )"
		dat="dat/${base}"
		echo "  ${base}"
		cp -a -f "$1" "${dat}"
		if use unicode ; then
			# convert to UTF-8
			iconv --from-code latin1 --to-code utf8 -o"${dat}.utf8" "${dat}"
			mv "${dat}.utf8" "${dat}"
		fi
		strfile -s "${dat}"
	}

	mkdir dat tmp
	for DIR in dat tmp ; do
		if [ ! -d ${DIR} ] ; then
			mkdir "${DIR}"
		fi
	done

	echo "Erstelle Fortune-Datenfiles ..."

	### Databases
	FORTUNES=`find data -maxdepth 1 -type f | sed "s?data/??"`
	FORTUNESMORE=`find data-more -maxdepth 1 -type f | sed "s?data-more/??"`
	DIRS=`find data -maxdepth 1 -type d | sed "s?data/??" | sed "/data/d"`

	### Rezepte
	REZEPTE=`find rezepte -maxdepth 1 -type d | sed "s?rezepte/??" | sed "/rezepte/d"`
	REZEPTTMP=rezept.tmp.$$

	# nicht veränderte Datenfiles
	for spruch in $FORTUNES; do
		str_it data/$spruch
	done

	# Ungeprüfte und unsortierte Datenfiles
	for spruch in $FORTUNESMORE; do
		str_it data-more/$spruch
	done

	# Datenfiles, die einzeln besser pflegbar sind, aber zu einem
	# Fortune-File zusammengefaßt werden
	for dir in $DIRS; do
	cat $( find data/$dir -type f | sort ) > tmp/$dir
		str_it tmp/$dir
		rm -f tmp/$dir
	done

	# zu formatierende Daten
	cd predata
	# komische Namen
	sed "s/.*/Wie man sein Kind nicht nennen sollte: \\
  & \\
%/" prenamen | sed "\$d" > ../tmp/namen
	# "Warmduscher"
	sed "s/.*/Hallo &!\\
%/" prewarmduscher | sed "\$d" > ../tmp/warmduscher
	cd ..
	str_it tmp/namen
	str_it tmp/warmduscher

	# Rezepte
	for typ in $REZEPTE ; do
		rm -f ${REZEPTTMP}
		for rezept in $( ls rezepte/$typ | sort ); do
			cat rezepte/$typ/$rezept >> ${REZEPTTMP}
			echo "%" >> ${REZEPTTMP}
		done
		sed "\$d" ${REZEPTTMP} > tmp/$typ
		str_it tmp/$typ
		rm -f ${REZEPTTMP}
	done

	# Script 'spruch' anpassen
	cat bin/spruch.sh | \
		sed "s?/usr/local/share/games/fortunes?/usr/share/fortune?" | \
		sed "s?\(FORTUNEPATH=\)/usr/local/games/?\1/usr/bin/?" | \
		sed "s?/etc/locale.alias?/usr/share/locale/locale.alias?g" | \
		sed "s?dpkg-reconfigure fortunes-de?emerge --oneshot ${CATEGORY}/${PN}:${SLOT}?" \
		> bin/spruch

	chmod 755 bin/spruch

}

src_install() {

	insinto /usr/share/fortune/de
	doins dat/* || die
	dobin bin/spruch
	dodoc README AUTHORS NEWS LIESMICH GPL-Deutsch
	doman man/spruch.6
	doman -i18n=de man/de/spruch.6

	if use unicode ; then
	
		dosed "s/iso-8859-1/utf-8/g" usr/bin/spruch

		cd ${S}
		# Create file with extension *.u8 to give fortune binary a hint to this encoding
		for f in $( ls -1 dat | grep -v ".dat$" ) ; do
			echo "Linking '${f}' ..."
			dosym ${f} /usr/share/fortune/de/${f}.u8
		done
	fi
}
