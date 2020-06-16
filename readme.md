# Packaging and storage for map tiles

This repository contains map tiles and debian packaging for them. They are used in [exam help](https://github.com/digabi/koe-ohje) geography section.

The ability to fork this repository is restricted due to Git LFS bandwidth quota.

## Preparing map tiles

Prerequisites:

- Node
- ImageMagick (Version 6.9.x was used to execute the scripts)

### 1. Prepare the original files

Create `temp` folder at the root of the repository. This will be your working folder. Then checkout `original-files` branch and copy the contents into `temp` folder.

Execute `extract-files.sh` script inside the utils folder. It will extract the files automatically to a correct structure. If you do the extracting manually the file structure is described below.

```
world_fi_0-8.tar.gz   -> temp/maps/world/fi/{0-8}
world_fi_9.tar.gz     -> temp/maps/world/fi/9
world_sv_0-8.tar.gz   -> temp/maps/world/sv/{0-8}
world_sv_9.tar.gz     -> temp/maps/world/sv/9
terrain_0-8.tar.gz    -> temp/maps/terrain/{Koko_Suomi, zoom_5, zoom_6, zoom_7_ja_8}
```

Checkout `test` or `master` branch depending where you want to add the new tiles into.

### 2. Create world map

World map tiles are generated with node app `copy-regions.js`. The app copies files from the source files to the given destination. Files copied are configured in the `ranges` variable at the beginning of `copy-regions.js`. Location of source files and the destination path are also configured at the top of the js file.

The map regions have been calculated by hand for each area and zoom level. These ranges are stored in the `regions.js` file.

Before copying the world map make sure the old tiles have been removed and that there is an empty folder for the tiles (the app doesn't create them). Folders needed are `tiles` and inside that folder `world`

Then to generate the current world map run this inside the utils folder.

`node copy-regions.js`

### 3. Create terrain map

Terrain map is generated using ImageMagick to scale, combine and split the original images to match the 256x256px tile size.

Execute `create-terrain-map.sh` inside the util folder.

If the script fails it can be run again as it removes the previously generated content automatically.
