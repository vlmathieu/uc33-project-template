# ---------------------------------------------------------------
# 01_import.py
# Loads the Comtrade extract and produces the France working table.
#
# Input  : data/raw/comtrade_fr_roundwood_clean.csv
# Output : data/processed/trade_france.csv
#
# THIS SCRIPT CONTAINS THREE PROBLEMS. Find them (lab 1).
# ---------------------------------------------------------------

import os
import pandas as pd

os.chdir("C:/Users/valentin/Documents/uc33-lab1")

trade = pd.read_csv("C:/Users/valentin/Documents/uc33-lab1/data/raw/comtrade_fr_roundwood_clean.csv")

france = trade[(trade.reporterDesc == "France") & (trade.partnerDesc != "World")]

france.to_csv("data/raw/trade_france.csv", index=False)

print("Written:", len(france), "rows")
