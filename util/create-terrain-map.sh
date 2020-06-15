#!/bin/bash
./make-tiles.sh ../temp/maps/terrain/Koko_Suomi/zoom_0/Yleiskarttarasteri_8milj.png ../tiles/terrain/1 2 3
./make-tiles.sh ../temp/maps/terrain/Koko_Suomi/zoom_1/Yleiskarttarasteri_45milj.png ../tiles/terrain/2 4 6
./make-tiles.sh ../temp/maps/terrain/Koko_Suomi/zoom_2_ja_3/Yleiskarttarasteri_2milj.png ../tiles/terrain/3 8 12
./make-tiles.sh ../temp/maps/terrain/Koko_Suomi/zoom_2_ja_3/Yleiskarttarasteri_2milj.png ../tiles/terrain/4 16 24
./make-tiles.sh ../temp/maps/terrain/Koko_Suomi/zoom_4/Yleiskarttarasteri_1milj.png ../tiles/terrain/5 32 48

./create-terrain-map-5.sh
./make-tiles.sh ../temp/terrain_6/K1.png ../tiles/terrain/6 64 96
