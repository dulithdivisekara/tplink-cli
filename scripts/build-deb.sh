#!/usr/bin/env bash
# Build Debian .deb package for tplink-cli
set -e

PKG_NAME="tplink-cli"
PKG_VER="1.0.0"
BUILD_DIR="/tmp/${PKG_NAME}_${PKG_VER}_deb"

rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/DEBIAN"
mkdir -p "${BUILD_DIR}/usr/local/bin"
mkdir -p "${BUILD_DIR}/usr/share/tplink-cli"

cp debian/control "${BUILD_DIR}/DEBIAN/"
cp -r tplink_cli "${BUILD_DIR}/usr/share/tplink-cli/"

cat << 'EOF' > "${BUILD_DIR}/usr/local/bin/tplink-cli"
#!/usr/bin/env bash
export PYTHONPATH="/usr/share/tplink-cli:${PYTHONPATH}"
exec /usr/bin/python3 -m tplink_cli.cli.main "$@"
EOF

chmod +x "${BUILD_DIR}/usr/local/bin/tplink-cli"

dpkg-deb --build --root-owner-group "${BUILD_DIR}" "${PKG_NAME}_${PKG_VER}_all.deb"
echo "Built Debian package: ${PKG_NAME}_${PKG_VER}_all.deb"
