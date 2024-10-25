# Scripts

pre/post install and pre/post rm scripts for Ragnarok's kernel build.

The `make bindeb-pkg` command provided by the kernel does not create
the proper scripts so we have to provide them ourselves (lifted off
Debian's standard kernel package). Ideally, these scripts would be
provided by the actual kernel package, but this is a simpler way of
doing it, since there's no need to rebuild the kernel in case the
scripts have a bug.
