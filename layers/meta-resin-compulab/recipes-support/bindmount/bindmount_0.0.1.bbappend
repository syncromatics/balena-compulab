SRC_URI = "git://github.com/resin-os/resinos-bindmount.git;protocol=git"

SRC_URI += " \
crate://crates.io/errno/0.2.3 \
crate://crates.io/kernel32-sys/0.2.2 \
crate://crates.io/libc/0.2.36 \
crate://crates.io/winapi-build/0.1.1 \
crate://crates.io/winapi/0.2.8 \
"