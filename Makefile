# Build the kernel and related packages quick.

all: kernel pkg

kernel:
	buildkernel

pkg:
	equivs-build ragnarok-kernel.pkg 2>&1 | tee $$_pkg.build

