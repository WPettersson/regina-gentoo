# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python2{_6,_7} )

inherit eutils cmake-utils python-r1

DESCRIPTION="Software for 3-manifold topology and normal surface theory"
HOMEPAGE="http://regina.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/regina-normal/regina/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+qt5 test doc mpi"

RDEPEND="dev-libs/boost[python]
	${PYTHON_DEPS}
	dev-libs/gmp[cxx]
	dev-libs/popt
	dev-libs/libxml2
	dev-libs/jansson
	dev-db/tokyocabinet
	qt5? (
		dev-qt/qtwidgets:5
		dev-qt/qtsvg:5
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
		$(cmake-utils_use_disable qt5 GUI)
	)
	cmake-utils_src_configure
}
