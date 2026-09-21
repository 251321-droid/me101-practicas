# Crear el vector notas
notas <- c(11, 14, 20, 8, 16, 13)

# Mostrar el primer y último elemento
primero <- notas[1]
ultimo <- notas[6]

print(primero)
print(ultimo)
# Calcular promedio, máximo y cantidad de aprobados
promedio <- mean(notas)
maximo <- max(notas)
cantidad_aprobados <- sum(notas >= 13.5)

print(promedio)
print(maximo)
print(cantidad_aprobados)
# Crear el data.frame
datos <- data.frame(
  nombre = c("Ana", "Luis", "Carlos", "Maria", "Pedro"),
  nota = c(15, 9, 18, 12, 8),
  asistencia_pct = c(90, 80, 95, 75, 60)
)

# Mostrar el data.frame
print(datos)
# Filtrar nota >= 10.5 y asistencia >= 70
filtrado <- datos[datos$nota >= 13.5 & datos$asistencia_pct >= 70, ]

print(filtrado)

