# Build the kernel and related packages quick.

PKG_VERSION = 01-5
VERSION = 6.1.123
SCRIPTS = preinst postinst prerm postrm

all: kernel pkg

kernel:
	buildkernel

pkg:
	for _file in ${SCRIPTS}; do \
		cp scripts/$$_file .; \
		sed -i -e 's|@VERSION@|${VERSION}|g' $$_file; \
		done
	equivs-build ragnarok-kernel.pkg 2>&1 | tee ragnarok-kernel_${PKG_VERSION}-amd64.build
	equivs-build linux-image-ragnarok-amd64.pkg 2>&1 | tee linux-image-ragnarok-amd64_${VERSION}.build
