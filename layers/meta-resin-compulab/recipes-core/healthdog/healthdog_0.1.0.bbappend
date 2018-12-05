SRC_URI = "git://github.com/balena-os/healthdog-rs.git;protocol=git"
SRC_URI += " \
	crate://crates.io/bitflags/0.7.0 \
	crate://crates.io/cfg-if/0.1.1 \
	crate://crates.io/errno/0.2.3 \
	crate://crates.io/exec/0.3.1 \
	crate://crates.io/getopts/0.2.14 \
	crate://crates.io/kernel32-sys/0.2.2 \
	crate://crates.io/libc/0.2.24 \
	crate://crates.io/libsystemd-sys/0.1.0 \
	crate://crates.io/log/0.3.8 \
	crate://crates.io/mbox/0.3.1 \
	crate://crates.io/nix/0.8.1 \
	crate://crates.io/pkg-config/0.3.9 \
	crate://crates.io/rustc_version/0.2.1 \
	crate://crates.io/semver-parser/0.7.0 \
	crate://crates.io/semver/0.6.0 \
	crate://crates.io/systemd/0.1.0 \
	crate://crates.io/utf8-cstr/0.1.6 \
	crate://crates.io/void/1.0.2 \
	crate://crates.io/winapi-build/0.1.1 \
	crate://crates.io/winapi/0.2.8 \
	"