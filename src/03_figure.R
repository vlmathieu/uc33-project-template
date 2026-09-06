# ---------------------------------------------------------------
# 03_figure.R
# Destinations of French oak log exports, 2022-2024.
#
# Input  : data/processed/trade_clean.csv   (produced by 02_cleaning.R)
# Output : output/figures/oak_destinations.png
#
# Lab 2, step 7. This script is written for you. Run it one block at
# a time and watch what each block produces before running the next.
# ---------------------------------------------------------------

# --- Dependencies ---
library(here)
library(ggplot2)

# --- Parameters ---
OAK   <- 440391    # HS code: oak logs
N_TOP <- 5         # destinations shown by name; the rest become "Other"

# --- Load ---
# This script starts from the OUTPUT of the previous one, not from the raw
# file. That is what makes it a separate script: it can be re-run on its own,
# and changing the figure does not mean re-running the cleaning.
clean <- read.csv(here("data", "processed", "trade_clean.csv"))

# --- 1. Filter: French oak log exports ---
oak <- subset(clean, cmdCode == OAK &
                     reporterDesc == "France" &
                     flowDesc == "Export")

# --- 2. Aggregate ---
# Read the formula as: sum primaryValue, for each combination of period
# and partnerDesc.
by_country <- aggregate(primaryValue ~ period + partnerDesc, data = oak, FUN = sum)

# The N_TOP biggest destinations over the whole period.
totals <- aggregate(primaryValue ~ partnerDesc, data = by_country, FUN = sum)
totals <- totals[order(-totals$primaryValue), ]
top    <- head(totals$partnerDesc, N_TOP)

# Everything else becomes "Other", then re-aggregate so the Others add up.
by_country$destination <- ifelse(by_country$partnerDesc %in% top,
                                 by_country$partnerDesc, "Other")
graph <- aggregate(primaryValue ~ period + destination, data = by_country, FUN = sum)

# Order the legend by size, with Other last.
graph$destination <- factor(graph$destination, levels = c(top, "Other"))

# --- 3. Plot ---
# aes() maps columns onto visual properties, geom_col() draws them as bars,
# labs() names them. Layers are added with +, one job each.
ggplot(graph, aes(x = factor(period), y = primaryValue / 1e6, fill = destination)) +
  geom_col() +
  labs(title = "French oak log exports (HS 440391)",
       x = NULL, y = "million USD", fill = "Destination")

# --- Output ---
ggsave(here("output", "figures", "oak_destinations.png"),
       width = 9, height = 5, dpi = 150)

cat("Figure written. Top destination:", as.character(totals$partnerDesc[1]),
    paste0("(", round(totals$primaryValue[1] / 1e6, 1), " M$ over three years)\n"))
