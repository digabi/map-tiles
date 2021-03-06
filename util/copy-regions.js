const fs = require("fs");
const path = require("path");
const { allRanges, europeRanges, finlandSwedenRanges } = require("./regions");

// Configuration

const ranges = [
  ...allRanges.filter((range) => range.zoom <= 6),
  ...europeRanges.filter((range) => range.zoom === 7 || range.zoom === 8),
  ...finlandSwedenRanges.filter((range) => range.zoom === 9),
];

const mapRootPathFi = path.join(__dirname, "../temp/maps/world/fi");
const mapRootPathSv = path.join(__dirname, "../temp/maps/world/sv");

const destination = path.join(__dirname, "../tiles/world");

// Node app

const verbose = process.argv.includes("verbose");

console.log("Files will be copied to:", destination, "\n");

console.log("Following ranges will be copied:");
console.log("-", ranges.map((range) => range.name).join("\n- "), "\n");

const copy = async () => {
  const destinationFiles = await fs.promises.readdir(destination);
  if (destinationFiles.length > 0) {
    console.error(
      "Error: Destination contains files! Please empty contents before copying"
    );
    process.exit(1);
  }

  const startTime = Date.now();

  console.log("Copying finnish tiles");
  const destinationFi = path.join(destination, "fi");
  await copyRanges(ranges, mapRootPathFi, destinationFi);

  console.log("Copying swedish tiles");
  const destinationSv = path.join(destination, "sv");
  await copyRanges(ranges, mapRootPathSv, destinationSv);

  const totalTime = (Date.now() - startTime) / 1000;
  console.log("Finished in ", totalTime, "s");
};

const copyRanges = async (ranges, mapRootPath, destinationPath) => {
  const copiedRanges = ranges.map(async (range) => {
    const rangePath = path.join(mapRootPath, String(range.zoom));
    return await copyRange(range, rangePath, destinationPath);
  });

  for await (const copiedRange of copiedRanges) {
    console.log("Files copied for range ", copiedRange.range.name);
  }
};

const copyRange = async (range, rangePath, destinationPath) => {
  const xDirectories = await fs.promises.readdir(rangePath);
  const xDirectoriesToCopy = xDirectories.map(async (xDirectory) => {
    if (Number(xDirectory) >= range.xMin && Number(xDirectory) <= range.xMax) {
      return {
        name: xDirectory,
        path: path.join(rangePath, xDirectory),
      };
    }
  });

  for await (const xDirectory of xDirectoriesToCopy) {
    if (!xDirectory) continue;

    const xDirectoryDestination = path.join(
      destinationPath,
      String(range.zoom),
      xDirectory.name
    );
    await fs.promises.mkdir(xDirectoryDestination, { recursive: true });

    const yFiles = await fs.promises.readdir(xDirectory.path);
    const yFilesToCopy = yFiles.map(async (yFile) => {
      const y = Number(yFile.split(".")[0]);
      if (y >= range.yMin && y <= range.yMax) {
        const yFilePath = path.join(xDirectory.path, yFile);
        const yFileDestination = path.join(xDirectoryDestination, yFile);

        if (verbose)
          console.log("Copying file", yFilePath, " to", yFileDestination);
        await fs.promises.copyFile(yFilePath, yFileDestination);
      }
    });

    await Promise.all(yFilesToCopy);
  }

  return { range };
};

copy();
