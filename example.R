example.R（実行例）
# ------------------------------------------------------------
# Example script for weighted_2mode_clustering
# ------------------------------------------------------------

# データ読み込み
beer <- read.csv("Beer.csv", row.names = 1, fileEncoding = "UTF-8-BOM")

# ブランド側クラスタリング係数
brand_cc <- weighted_2mode_clustering(beer, mode = "row")
print(brand_cc)

# イメージ側クラスタリング係数
image_cc <- weighted_2mode_clustering(beer, mode = "col")
print(image_cc)
