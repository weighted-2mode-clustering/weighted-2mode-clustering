# weighted_2mode_clustering

This repository provides the R function `weighted_2mode_clustering`, 
developed for the study:

**"Marketing Analysis via Weighted Two-Mode Network" (Under Review)**

The function computes an asymmetric weighted two-mode clustering coefficient, which measures the degree of structural overlap (redundancy) between nodes in a bipartite network. It is particularly designed for marketing research where brand × image weighted data are common.

## Files
- `weighted_2mode_clustering.R`: Main function script.
- `example.R`: A script demonstrating how to use the function.
- `Beer.csv`: A small sample dataset (2 brands × 2 images) for testing.

## Usage
To calculate the clustering coefficients, run the following in R:

```r
source("weighted_2mode_clustering.R")

# Load sample data
beer <- read.csv("Beer.csv", row.names = 1)

# Brand-side clustering (measures how much a brand overlaps with others)
brand_cc <- weighted_2mode_clustering(beer, mode = "row")
brand_cc

# Image-side clustering (measures how much an image overlaps with others)
image_cc <- weighted_2mode_clustering(beer, mode = "col")
image_cc
