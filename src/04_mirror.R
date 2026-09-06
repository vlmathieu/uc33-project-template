# ---------------------------------------------------------------
# 04_mirror.R
# Mirror statistics: what France says it exports, against what its
# partners say they import from France.
#
# Input  : data/processed/trade_clean.csv   (produced by 02_cleaning.R)
# Output : output/tables/mirror_gaps.csv
#
# Lab 2, challenge 2. The loading line is written; the rest is yours.
# The brief in challenges.md gives you the code for each step.
# ---------------------------------------------------------------

# --- Dependencies ---
library(here)

# --- Load ---
clean <- read.csv(here("data", "processed", "trade_clean.csv"))

# --- 1. One case: French oak logs to China, 2023 ---

# --- 2. The general comparison: a join ---

# --- 3. How big is the CIF/FOB effect on the whole file? ---

# --- Conclusion ---
# Three lines: what explains what, and what is left unexplained.

# --- Output ---
# write.csv(comp, here("output", "tables", "mirror_gaps.csv"), row.names = FALSE)
