library(tidyverse)
library(e1071)

# Leer datos (se guarda en df, que es lo que usa el resto del código)
df <- read_csv("estudiantes_limpio.xls")

head(df)
str(df)

# ============================================================
# 1. ESTADÍSTICOS BÁSICOS
# ============================================================
media    <- mean(df$nota, na.rm = TRUE)
mediana  <- median(df$nota, na.rm = TRUE)
desv_std <- sd(df$nota, na.rm = TRUE)
varianza <- var(df$nota, na.rm = TRUE)
q1       <- quantile(df$nota, 0.25, na.rm = TRUE)
q3       <- quantile(df$nota, 0.75, na.rm = TRUE)
iqr      <- IQR(df$nota, na.rm = TRUE)

cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Desviación estándar:", desv_std, "\n")
cat("Varianza:", varianza, "\n")
cat("Q1:", q1, "\n")
cat("Q3:", q3, "\n")
cat("IQR:", iqr, "\n")

# ============================================================
# 2. SKEWNESS Y KURTOSIS
# ============================================================
skew_nota <- skewness(df$nota, na.rm = TRUE)
kurt_nota <- kurtosis(df$Snota, na.rm = TRUE)

cat("Skewness:", skew_nota, "\n")
cat("Kurtosis:", kurt_nota, "\n")

# ============================================================
# 3. FUNCIÓN RESUMEN_ESTADISTICO
# ============================================================
resumen_estadistico <- function(vector, decimales = 4) {
  n        <- sum(!is.na(vector))
  media    <- mean(vector, na.rm = TRUE)
  mediana  <- median(vector, na.rm = TRUE)
  desv_std <- sd(vector, na.rm = TRUE)
  cv_pct   <- (desv_std / media) * 100
  
  return(list(
    n        = n,
    media    = round(media, decimales),
    mediana  = round(mediana, decimales),
    desv_std = round(desv_std, decimales),
    cv_pct   = round(cv_pct, decimales)
  ))
}

print(resumen_estadistico(df$nota))

# ============================================================
# 4. FUNCIÓN CLASIFICAR_DISPERSION
# ============================================================
clasificar_dispersion <- function(cv_pct) {
  if (cv_pct < 15) {
    return("Baja")
  } else if (cv_pct < 30) {
    return("Moderada")
  } else {
    return("Alta")
  }
}

# ============================================================
# 5. APLICAR A NOTA Y ASISTENCIA
# ============================================================
for (columna in c("nota", "asistencia_pct")) {
  resumen <- resumen_estadistico(df[[columna]])
  nivel   <- clasificar_dispersion(resumen$cv_pct)
  
  cat("\nColumna:", columna, "\n")
  print(resumen)
  cat("Nivel de dispersión:", nivel, "\n")
}
