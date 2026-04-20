# weighted_2mode_clustering

This repository provides the R function `weighted_2mode_clustering`, 
developed for the study:

**"Marketing Analysis via Weighted Two-Mode Network" (Under Review)**

The function computes an asymmetric weighted two-mode clustering coefficient, which measures the degree of structural overlap (redundancy) between nodes in a bipartite network. It is particularly designed for marketing research where brand × image weighted data are common.


# Definition
For a weighted two-mode matrix 
𝑋
 (brands × images),
the asymmetric clustering coefficient of brand 
𝑢
 with respect to brand 
𝑣
 is defined as:

𝐶
𝑢
(
𝑣
)
=
∑
𝑖
min
⁡
(
𝑋
𝑢
𝑖
,
𝑋
𝑣
𝑖
)
∑
𝑖
𝑋
𝑢
𝑖
where:

𝑋
𝑢
𝑖
 = weight of the tie between brand 
𝑢
 and image 
𝑖

min
⁡
(
𝑋
𝑢
𝑖
,
𝑋
𝑣
𝑖
)
 extracts the overlapping portion of the two brands’ image profiles

the denominator 
∑
𝑖
𝑋
𝑢
𝑖
 normalizes by the total image weight of brand 
𝑢

The overall clustering coefficient of brand 
𝑢
 is the average of 
𝐶
𝑢
(
𝑣
)
 over all other brands 
𝑣
.

🧠 Interpretation
𝐶
𝑢
(
𝑣
)
 measures how much of brand 
𝑢
’s image structure is redundant with brand 
𝑣
.

Because the denominator is based on brand 
𝑢
’s total image weight,
the measure is asymmetric:

𝐶
𝑢
(
𝑣
)
≠
𝐶
𝑣
(
𝑢
)
A high value means that brand 
𝑢
 is strongly overlapped (cannibalized) by brand 
𝑣
.

A low value means that brand 
𝑢
 holds non‑redundant, distinctive image associations  
(i.e., occupies a structural hole).

This formulation extends Latapy et al. (2008) to weighted data and introduces directionality,
which is essential for marketing applications where brand uniqueness matters.



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
