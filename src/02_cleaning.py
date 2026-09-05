# ---------------------------------------------------------------
# 02_cleaning.py
# Loads the degraded Comtrade extract and produces the cleaned
# working table.
#
# Input  : data/raw/comtrade_fr_roundwood_dirty.csv
# Output : data/processed/trade_clean.csv
#
# Lab 2. The loading line below is the naive one, and it does not
# work. Steps 2 and 3 of the brief tell you why, and what to add.
# Everything after it is yours.
# ---------------------------------------------------------------

# --- Dependencies ---
from pathlib import Path
import pandas as pd

# --- Parameters ---
ROOT = Path(__file__).resolve().parents[1]

# --- Load ---
trade = pd.read_csv(ROOT / "data" / "raw" / "comtrade_fr_roundwood_dirty.csv")

# --- Diagnose ---


# --- Clean ---
# One comment per decision: the WHY, not the what.


# --- Output ---
# clean.to_csv(ROOT / "data" / "processed" / "trade_clean.csv", index=False)
