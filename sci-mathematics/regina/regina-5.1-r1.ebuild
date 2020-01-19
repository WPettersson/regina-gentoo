# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit eutils cmake-utils python-r1

DESCRIPTION="Software for 3-manifold topology and normal surface theory"
HOMEPAGE="http://regina-normal.github.io/"
SRC_URI="https://github.com/regina-normal/regina/releases/download/${P}/${P}.tar.gz"

PATCHES=(
	"${FILESDIR}"/${P}-patch_boost_python.patch
	"${FILESDIR}"/${P}-gcc-7.patch
	"${FILESDIR}"/${P}-qtui-python27.patch
)

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
		-DDISABLE_GUI="$(usex qt5 no yes)"
		-DPYTHON_EXECUTABLE=/usr/bin/python2
		-DPYTHON_LIBRARY=/usr/lib64/libpython2.7.so
		-DPYTHON_INCLUDE_DIR=/usr/include/python2.7
	)
	cmake-utils_src_configure
}
