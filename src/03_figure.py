# ---------------------------------------------------------------
# 03_figure.py
# Destinations of French oak log exports, 2022-2024.
#
# Input  : data/processed/trade_clean.csv   (produced by 02_cleaning.py)
# Output : output/figures/oak_destinations.png
#
# Lab 2, step 7. This script is written for you. Run it one block at
# a time and watch what each block produces before running the next.
# ---------------------------------------------------------------

# --- Dependencies ---
# matplotlib is not part of pandas. If the import fails:
#     python -m pip install matplotlib
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

# --- Parameters ---
ROOT  = Path(__file__).resolve().parents[1]
OAK   = 440391    # HS code: oak logs
N_TOP = 5         # destinations shown by name; the rest become "Other"

# --- Load ---
# This script starts from the OUTPUT of the previous one, not from the raw
# file. That is what makes it a separate script: it can be re-run on its own,
# and changing the figure does not mean re-running the cleaning.
clean = pd.read_csv(ROOT / "data" / "processed" / "trade_clean.csv")

# --- 1. Filter: French oak log exports ---
oak = clean[(clean.cmdCode == OAK)
            & (clean.reporterDesc == "France")
            & (clean.flowDesc == "Export")]

# --- 2. Aggregate ---
# One row per year, one column per destination.
by_country = oak.pivot_table(index="period", columns="partnerDesc",
                             values="primaryValue", aggfunc="sum", fill_value=0)

# The N_TOP biggest destinations over the whole period; the rest become "Other".
totals = by_country.sum().sort_values(ascending=False)
top    = list(totals.index[:N_TOP])

graph = by_country[top].copy()
graph["Other"] = by_country.drop(columns=top).sum(axis=1)

# --- 3. Plot ---
ax = (graph / 1e6).plot(kind="bar", stacked=True, figsize=(9, 5), width=0.6)
ax.set_title("French oak log exports (HS 440391)")
ax.set_xlabel("")
ax.set_ylabel("million USD")
ax.legend(title="Destination", bbox_to_anchor=(1.02, 1), loc="upper left")
plt.tight_layout()

# --- Output ---
plt.savefig(ROOT / "output" / "figures" / "oak_destinations.png", dpi=150)

print("Figure written. Top destination:", totals.index[0],
      f"({totals.iloc[0]/1e6:.1f} M$ over three years)")
