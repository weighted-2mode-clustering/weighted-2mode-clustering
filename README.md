# weighted_2mode_clustering

This repository provides the R function **`weighted_2mode_clustering`**, developed for the study:

**"Marketing Analysis via Weighted Two-Mode Network" (Under Review)**

The function computes an **asymmetric weighted two-mode clustering coefficient**, which measures the degree of structural overlap (redundancy) between nodes in a bipartite network.  
It is particularly designed for marketing research where **brand × image weighted data** are common.

---

## 📐 Definition

For a weighted two-mode matrix \(X\) (brands × images),  
the asymmetric clustering coefficient of brand \(u\) with respect to brand \(v\) is defined as:

$$
C_u(v) = 
\frac{\sum_i \min(X_{ui}, X_{vi})}{\sum_i X_{ui}}
$$

where:

- \(Xui\): weight of the tie between brand \(u\) and image \(i\)  
- \(Σi min(Xui, Xvi)\): overlapping portion of the two brands’ image profiles  
- denominator \(Σi Xui\): normalizes by the total image weight of brand \(u\)

The overall clustering coefficient of brand \(u\) is the average of \(C_u(v)\) over all other brands \(v\).

---

## 🧠 Interpretation

- \(C_u(v)\) measures **how much of brand \(u\)’s image structure is redundant with brand \(v\)**.  
- Because the denominator is based on brand \(u\)’s total image weight, the measure is **asymmetric**:

$$
C_u(v) \neq C_v(u)
$$

- A **high** value means brand \(u\) is strongly overlapped (cannibalized) by brand \(v\).  
- A **low** value means brand \(u\) holds **non‑redundant, distinctive image associations**  
  (i.e., occupies a structural hole).

This formulation extends Latapy et al. (2008) to weighted data and introduces **directionality**,  
which is essential for marketing applications where **brand uniqueness** matters.

---

## 📁 Files

- `weighted_2mode_clustering.R`: Main function script  
- `example.R`: Usage example  
- `Beer.csv`: Small sample dataset (2 brands × 2 images)

---

## ▶ Usage

```r
source("weighted_2mode_clustering.R")

# Load sample data
beer <- read.csv("Beer.csv", row.names = 1)

# Brand-side clustering (how much a brand overlaps with others)
brand_cc <- weighted_2mode_clustering(beer, mode = "row")
brand_cc

# Image-side clustering (how much an image overlaps with others)
image_cc <- weighted_2mode_clustering(beer, mode = "col")
image_cc
```

---
