# Project template — UC 3.3 Modeling

A reproducible project skeleton. Starting point for lab 1 on 7 September, and the
template for your projects for the rest of the year.

**To use it**: green *Use this template* button (from October), or *Code → Download ZIP*
until then. Then rename the folder and the `.Rproj` file.

## Layout

```
data/
  raw/          inputs. NEVER modified, never overwritten.
  processed/    produced by the scripts. Regenerable.
src/            the scripts, prefixed 01_, 02_, 03_, 04_ in run order.
                Each reads a file on disk and writes one: no script depends
                on something another one left in memory.
output/
  figures/      regenerable. Deletable without regret.
  tables/
config/
  config.yml    the parameters. No hard-coded value in the scripts.
doc/            notes, reports, Quarto
```

## The four rules

1. **What is in `data/raw/` is never modified.** Every transformation goes through a
   script that reads from `raw/` and writes somewhere else.
2. **Nothing in `output/` is precious.** You must be able to delete all of it and
   rebuild it by running the scripts. If that frightens you, a result exists that no
   script can reproduce — and it is not defensible.
3. **No absolute paths, never `setwd()`.** Open the `.Rproj`: the working directory is
   the project root, and all your relative paths work.
4. **A script is only correct if it runs from an empty session, top to bottom.**
   RStudio: `Session > Restart R` then `Ctrl+Shift+Enter`. Elsewhere: run it from the
   terminal, which always starts a fresh process.

## Getting started

1. Download `comtrade_fr_roundwood_clean.csv` from the
   [course repository](https://github.com/vlmathieu/firs-uc33-modeling/tree/main/05-data)
   and put it in `data/raw/`.
2. Open `uc33-project.Rproj` in RStudio, **and** the folder in VS Code.
3. Open `src/01_import.R`. It contains three deliberate problems: that is the subject of
   lab 1.
4. `src/02_cleaning.R` is the starting point for lab 2 — a header and a loading line
   that does not yet work. `src/03_figure.R` is lab 2's last step, written for you.
   `src/04_mirror.R` is one of lab 2's challenges. Leave all three alone until then.

## What this README should say in YOUR project

What the folder is for, what has to be installed to run it, and in what order the
scripts run. Four lines is enough. Those are the four lines your partner will not have
to ask you for.
