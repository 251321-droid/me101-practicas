gris <- matrix(rep(seq(0, 255, length.out = 5), times = 5),
               nrow = 5, ncol = 5, byrow = TRUE)
print(gris)
print(dim(gris))
print(mean(gris))
####2. Imagen RGB de dos mitades
rgb <- array(0, dim = c(4, 4, 3))

# mitad izquierda (columnas 1-2): (255, 200, 0)
rgb[, 1:2, 1] <- 255
rgb[, 1:2, 2] <- 200
rgb[, 1:2, 3] <- 0

# mitad derecha (columnas 3-4): (0, 0, 255)
rgb[, 3:4, 1] <- 0
rgb[, 3:4, 2] <- 0
rgb[, 3:4, 3] <- 255

print(dim(rgb))
cat("Pixel [1,1]:", rgb[1, 1, ], "\n")
cat("Pixel [1,4]:", rgb[1, 4, ], "\n")
####3. Luminosidad ponderada
gris_luminosidad <- 0.299 * rgb[, , 1] + 0.587 * rgb[, , 2] + 0.114 * rgb[, , 3]
print(gris_luminosidad)