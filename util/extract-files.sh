#!/bin/bash

echo "Extracting world_fi_0-8.tar.gz"
mkdir -p ../temp/maps/world/fi
tar -xf ../temp/world_fi_0-8.tar.gz -C ../temp/maps/world/fi
mv ../temp/maps/world/fi/world-fi-0-8/* ../temp/maps/world/fi/
rm -rf ../temp/maps/world/fi/world-fi-0-8

echo "Extracting world_fi_9.tar.gz"
tar -xf ../temp/world_fi_9.tar.gz -C ../temp/maps/world/fi
mv ../temp/maps/world/fi/world_fi_9/* ../temp/maps/world/fi/
rm -rf ../temp/maps/world/fi/world_fi_9

echo "Extracting world_sv_0-8"
mkdir -p ../temp/maps/world/sv
tar -xf ../temp/world_sv_0-8.tar.gz -C ../temp/maps/world/sv
mv ../temp/maps/world/sv/world_sv_0-8/* ../temp/maps/world/sv/
rm -rf ../temp/maps/world/sv/world_sv_0-8

echo "Extracting world_sv_9.tar.gz"
tar -xf ../temp/world_sv_9.tar.gz -C ../temp/maps/world/sv
mv ../temp/maps/world/sv/world_sv_9/* ../temp/maps/world/sv/
rm -rf ../temp/maps/world/sv/world_sv_9

echo "Extracting terrain_0-8.tar.gz"
mkdir -p ../temp/maps/terrain
tar -xf ../temp/terrain_0-8.tar.gz -C ../temp/maps/terrain
mv ../temp/maps/terrain/terrain_0-8/* ../temp/maps/terrain
rm -rf ../temp/maps/terrain/terrain_0-8
