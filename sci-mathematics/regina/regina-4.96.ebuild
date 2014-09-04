# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_COMPAT=( python2{_6,_7} )

inherit eutils cmake-utils python-r1

DESCRIPTION="Software for 3-manifold topology and normal surface theory"
HOMEPAGE="http://regina.source-forge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+qt4 test sourcehighlight doc mpi"

RDEPEND="dev-libs/boost[python]
	${PYTHON_DEPS}
	dev-libs/gmp[cxx]
	dev-libs/popt
	dev-libs/libxml2
	dev-db/tokyocabinet
	qt4? (
		>=dev-qt/qtcore-4.6
		>=dev-qt/qtgui-4.6
		sourcehighlight? (
			>=dev-util/source-highlight-3.1.1
		)
	)
	mpi? (
		virtual/mpi
	) "
DEPEND="${RDEPEND}
	doc? (
		app-doc/doxygen
		dev-libs/libxslt
	)
	test? (
		dev-util/cppunit
	)"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_disable qt4 GUI)
	)
	cmake-utils_src_configure
}
