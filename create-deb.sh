DEB_VERSION=1.0.${BUILD_NUMBER}

fpm -s dir --name map-tiles --architecture all -t deb --version $DEB_VERSION ./tiles=/usr/local/share/map-tiles
