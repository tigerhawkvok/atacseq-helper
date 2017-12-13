# ATAC-seq Analysis
=====================================

## Prerequisites

Your system MUST have Homebrew or Linuxbrew installed.

- Linuxbrew: http://linuxbrew.sh/
- Homebrew: https://brew.sh/

The script `install-dependencies.sh` assumes you have that available.

## Configuration

Open a terminal at the root of this repository and run

```bash
sudo chmod +x ./install-dependencies.sh
./install-dependencies.sh
```

This will configure your system for the rest of the project. **This step may take up to an hour or two to complete**.

## Generating Bedfiles

To convert your gzipped or unzipped `SAM` files to binary, peak, index, and bedfiles, run:

```bash
python3 ./samlooper.py
```

This script has a single configuration variable: at the top, set `DO_FOOTPRINTING` to `True` if you want to analyse footprints and profiles, and `False` otherwise.

Note this is VERY SLOW. This will take 1-2 hours per file in total to process fully (unzip, convert to binary, index, quality filter, peak find, bed creation, footprint, and profile).
