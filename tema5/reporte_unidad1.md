# Reporte de cierre: Unidad I (Tema 5)

**Dataset:** estudiantes_limpio (5 estudiantes, variables nota y asistencia_pct)

## a) Estadísticos descriptivos principales

| Columna | Media | Desv. std | CV (%) |
| --- | --- | --- | --- |
| nota | 15.20 | 2.3076 | 15.18 |
| asistencia_pct | 87.75 | 6.1796 | 7.04 |

La nota promedio es 15.2 sobre 20, con una mediana de 15.5. La asistencia promedio es de casi 88%.

## b) Nivel de dispersión (según clasificar_dispersion())

- **nota: Moderada.** Su CV es 15.18%, apenas por encima del límite de 15%, así que las notas varían un poco más que en un grupo muy homogéneo.
- **asistencia_pct: Baja.** Su CV es 7.04%, es decir, los estudiantes tienen asistencias bastante parecidas entre sí.

## c) Diferencias de convención entre librerías

Descubrí que las librerías no siempre usan la misma fórmula por defecto. La desviación estándar coincidió entre pandas y R porque ambos dividen entre n-1. En cambio, la varianza no coincidió: numpy dividió entre n (4.26) y R entre n-1 (5.325). Con tan pocos datos la diferencia se nota mucho. También el skewness y la kurtosis dieron valores distintos entre pandas, scipy y e1071, porque cada una usa una fórmula distinta. La conclusión es que siempre hay que revisar la documentación y saber qué versión se está calculando antes de comparar resultados.