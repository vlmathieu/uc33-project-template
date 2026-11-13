# Project template — UC 3.3 Modeling

A reproducible project skeleton. Starting point for lab 1 on 7 September, and the
template for your projects for the rest of the year.

## Getting the repository

1. On GitHub, open
   [vlmathieu/uc33-project-template](https://github.com/vlmathieu/uc33-project-template)
   and click **Use this template → Create a new repository**. Name it after your
   project, keep it **private**, and add your teammates under
   *Settings → Collaborators*.

2. Clone **your** copy — not this one:

   ```
   git clone https://github.com/<your-account>/<your-project>.git
   cd <your-project>
   ```

3. Check which repository you are actually in:

   ```
   git remote -v
   ```

   It must print `<your-account>/<your-project>`. If it prints `vlmathieu/...` you
   cloned the template itself: delete the folder and start again at step 1.

With the GitHub CLI, steps 1 and 2 are one line:

```
gh repo create <your-project> --template vlmathieu/uc33-project-template --private --clone
```

No GitHub account yet: *Code → Download ZIP*, unzip, then run `git init` in the folder.

## First 15 minutes — starting a project of your own

Doing lab 1? Skip this section: the scripts in `src/` **are** the lab.

Otherwise, rename and delete before you write a line of your own. A template is a
starting point, not a folder to hand in as you found it.

**Rename**

- [ ] the folder itself
- [ ] `uc33-project.Rproj` → `<your-project>.Rproj` — nothing inside the file holds the
      name, so renaming it is enough
- [ ] this README, in full. See *What this README should say in YOUR project* below.
- [ ] the values in `config/config.yml`. They are a UC 3.3 example, not settings to keep.

**Delete**

- [ ] every script in `src/` **whose header names a lab**. They are course exercises and
      have nothing to do with your project.
- [ ] the language twin you do not use: either the `.R` files or the `.py` files, not both.

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
deliverables/
  01-report/    the report
  02-slides/    the presentation
doc/            working notes, bibliography, annexes
```

`deliverables/` holds what is graded. `doc/` holds what is still in progress. When you
cannot tell which of the two a file belongs in, it belongs in `doc/`.

Project-management material — charter, scoping note, logbook, project review, peer
assessment — is **not** in this repository, and must not be added to it. It is handed in
separately, because those documents discuss people and this repository is read by your
whole team. A sentence written where your teammates will read it tonight is not the
sentence you would have written for your supervisor.

## Language

- Paths, folder names, file names, code, variable names, commit messages: **English**.
- The report and the slides: **the working language set at project launch** (scoping
  note, section 1). State it in this README, in one line.

Nobody translates a document to satisfy a folder name, and nobody puts an accent in a
folder name to match a document.

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

Your repository is one of the graded deliverables, so this file is graded with it. It
belongs to the member of your team responsible for data and reproducibility — whose
mandate, in your own scoping note, is "a README that lets a third party replay the
processing".

**The criterion, and it is testable:** someone who has never seen your project must be
able to regenerate every figure in your report from `data/raw/` alone, without asking
you a single question. Your supervisor can try it.

Six points, one to three lines each:

1. **What this repository is** — the question you were asked, and who asked it.
2. **What has to be installed** — language, version, and the list of packages. Not
   "install R": the names.
3. **In what order the scripts run** — and what each one produces.
4. **Where the data comes from** — source, extraction date, and **what it does not
   cover**. That last part is the one everyone forgets, and the one that shows.
5. **Where the deliverables are** — one line pointing to `deliverables/`.
6. **The working language** — one line.

What this file is not: a summary of your report, a copy of the four rules above — they
are the template's instructions, not your content — and not a logbook.
