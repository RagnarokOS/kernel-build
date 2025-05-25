# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pre-built version of Ragnarok's Linux kernel build"
HOMEPAGE="https://github.com/RagnarokOS/kernel-build"
SRC_URI="https://github.com/RagnarokOS/kernel-build/releases/tag/${PVR}/linux-ragnarok-bin-${PVR}.tgz"

SLOT="0"
KEYWORDS="amd64"

# Fetch gentoo-sources first.
DEPEND="sys-kernel/gentoo-sources-${PVR}"
RDEPEND="${DEPEND}"
BDEPEND="
		app-alternatives/bc
		app-alternatives/flex
		virtual/libelf
		app-alternatives/yacc
"

QA_PREBUILT="*"

src_install() (
	declare MODULES_TARGET=/usr/lib/modules/${PVR}-ragnarok
	declare SRC_DIR=/usr/src/linux-${PVR}-gentoo

	dodir ${MODULES_TARGET}

	insinto ${MODULES_TARGET}
		doins -r ${PVR}-ragnarok

	dodir boot
	
	insinto boot
		doins -r boot
	
	# Put Ragnarok's config in Gentoo's kernel source dir.
	insinto ${SRC_DIR}
		doins .config
)

pkg_postinst() {
	dodir /usr/src/linux
	dosym /usr/src/linux-${PVR}-gentoo /usr/src/linux
}
