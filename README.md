ATAC-seq Analysis
=====================================

## Prerequisites

Your system MUST have Homebrew or Linuxbrew installed.

- Linuxbrew: http://linuxbrew.sh/
- Homebrew: https://brew.sh/

The script `install-dependencies.sh` assumes you have that available.

## Setup

1. Once you've cloned or downloaded this repository, drop all its files into the root directory containing your files needing analysis.
2. Go to https://conda.io/miniconda.html , download, and run the installer appropriate for your platform. (The OSX installer is included in this repo).

That's all!

## Configuration

Open a terminal **at the root of this repository** and run

```bash
sudo chmod +x *.sh
./install-dependencies.sh
```

This will configure your system for the rest of the project. **This step may take up to an hour or two to complete**.


### Problems on OSX?
If you're on OSX some versions intermittently complain about the file ending of scripts. If it does, instead run

```bash
mv *.sh *.command
sudo chmod +x *.command
./install-dependencies.command
```

to configure your dependencies.

## Generating Bedfiles

To convert your gzipped or unzipped `SAM` files to binary, peak, index, and bedfiles, run:

```bash
python ./samlooper.py
```

This script has a single configuration variable: at the top, set `DO_FOOTPRINTING` to `True` if you want to analyse footprints and profiles, and `False` otherwise.

Note this is VERY SLOW. This will take 1-2 hours per file in total to process fully (unzip, convert to binary, index, quality filter, peak find, bed creation, footprint, and profile).


## Processing Bedfiles

TODO

## Annotating Bedfiles

TODO


## Running Counts

Be sure you've generated your bedfiles -- they also generate the sorted q2 `*.bam` files you need to get this part going.

You'll need to edit `do-htseq-counts.py`. Near the top of the file, after the docstring, you'll find a [python `dictionary` datatype object](https://docs.python.org/3/tutorial/datastructures.html#dictionaries) named `bamPrettyMap`.

Edit this file to set the labels you desire as the (unique) dictionary key, and the  `*.sorted.q2.bam` filename as the value, for example:

```python
bamPrettyMap = {
    "LYR_CD_CON2": "AT-A-11_S9_BowtieOut.sorted.q2.bam",
    "LYR_CD_CON3": "AT-B-38_S22_BowtieOut.sorted.q2.bam",
    "LYR_CD_DR1": "AT-A-16_S1_BowtieOut.sorted.q2.bam"
}
```

If your key has a underscore-separated prefix, it'll only match those samples against`gff3` files that contain that (case-sensitive) substring; eg, in the example above, only `*.gff3` containing `LYR` will be used for matching. If there is no underscore-separated prefix, no species matching will be used.

By default, the file also has a configuration value `overwriteExistingCounts` set to `False`. Set this value to `True` to regenerate everything each time you run this script.

Then, once you've done that, simply run

```bash
python ./do-htseq-counts.py
```

Counts will be output as both `csv` and `txt`.
