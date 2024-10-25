# Build the kernel and related packages quick.

VERSION = 6.1.112
SCRIPTS = preinst postinst prerm postrm

all: kernel pkg

kernel:
	buildkernel

pkg:
	for _file in ${SCRIPTS}; do \
		cp scripts/$$_file .; \
		sed -i -e 's|@VERSION@|${VERSION}|g' $$_file; \
		done
	equivs-build ragnarok-kernel.pkg 2>&1 | tee $$_pkg.build

