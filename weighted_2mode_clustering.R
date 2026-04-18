# ------------------------------------------------------------
# weighted_2mode_clustering()
# 加重2モードクラスタリング係数（非対称）を計算する関数
# mode = "row" : 行方向（ブランド側）
# mode = "col" : 列方向（イメージ側）
# ------------------------------------------------------------

weighted_2mode_clustering <- function(mat, mode = c("row", "col")) {

  # mode の指定（row = ブランド側、col = イメージ側）
  mode <- match.arg(mode)

  # 数値行列に変換
  mat <- as.matrix(mat)
  mat <- apply(mat, 2, as.numeric)

  # イメージ側を計算する場合は転置
  if (mode == "col") {
    mat <- t(mat)
  }

  n <- nrow(mat)
  result <- numeric(n)

  for (i in 1:n) {
    overlaps <- c()

    for (j in 1:n) {
      if (i != j) {

        # 各ブランド（またはイメージ）との重なりの最小値
        w_min <- pmin(mat[i, ], mat[j, ])

        # 分母は「自分の総量」
        Oij <- sum(w_min) / sum(mat[i, ])

        overlaps <- c(overlaps, Oij)
      }
    }

    # i のクラスタリング係数は、他ノードとの平均
    result[i] <- mean(overlaps)
  }

  names(result) <- rownames(mat)
  return(result)
}
