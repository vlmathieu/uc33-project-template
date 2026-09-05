# ---------------------------------------------------------------
# 01_import.R
# Loads the Comtrade extract and produces the France working table.
#
# Input  : data/raw/comtrade_fr_roundwood_clean.csv
# Output : data/processed/trade_france.csv
#
# THIS SCRIPT CONTAINS THREE PROBLEMS. Find them (lab 1).
# ---------------------------------------------------------------

setwd("C:/Users/valentin/Documents/uc33-lab1")

trade <- read.csv("C:/Users/valentin/Documents/uc33-lab1/data/raw/comtrade_fr_roundwood_clean.csv")

france <- subset(trade, reporterDesc == "France" & partnerDesc != "World")

write.csv(france, "data/raw/trade_france.csv", row.names = FALSE)

cat("Written:", nrow(france), "rows\n")
