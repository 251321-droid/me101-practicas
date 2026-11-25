# Resumen geoespacial — Tema 12: Datos Geoespaciales

**Estudiante:** Jean Anthony Ccahuana Carrion
**Curso:** Programación Estadística y Visualización de Datos (ME101)
**Semana:** 12 — inicio de la Unidad III

---

## (a) Los lugares que elegí y por qué

Elegí cinco lugares reales de mi vida diaria y de mi ciudad, Cusco. Mezclé sitios cotidianos, sitios emblemáticos y uno muy lejano para que las distancias tuvieran escalas distintas.

| Lugar | Latitud | Longitud | Por qué lo elegí |
|---|---|---|---|
| UNSAAC | -13.521763 | -71.958256 | Es mi universidad, donde estudio y llevo este curso. |
| Mi casa | -13.539188 | -71.911134 | Es donde vivo; queda al sureste del centro de Cusco. |
| Casa de mis padres | -12.868190 | -72.693778 | Es un lugar importante para mí y queda lejos de la ciudad, al noroeste. |
| Sacsayhuamán | -13.509601 | -71.982229 | Es un complejo arqueológico emblemático que domina la ciudad. |
| Plaza de Armas | -13.516653 | -71.979182 | Es el centro histórico y el punto de referencia más conocido de Cusco. |

Cuatro de los lugares están dentro de la ciudad, a pocos kilómetros entre sí, y uno está a más de 100 km. Eso se nota en `mapa_basico.png`: los puntos de Cusco quedan amontonados y sus etiquetas se superponen, mientras que la casa de mis padres aparece aislada en la esquina superior izquierda.

## (b) Par más cercano y más lejano

Calculé las distancias con mi propia función `distancia_haversine` (radio de la Tierra de 6371 km) para las 10 combinaciones posibles de lugares:

| Par | Distancia (km) |
|---|---|
| Sacsayhuamán ↔ Plaza de Armas | 0.8505 |
| UNSAAC ↔ Plaza de Armas | 2.3327 |
| UNSAAC ↔ Sacsayhuamán | 2.9234 |
| UNSAAC ↔ Mi casa | 5.4503 |
| Mi casa ↔ Plaza de Armas | 7.7717 |
| Mi casa ↔ Sacsayhuamán | 8.3607 |
| Casa de mis padres ↔ Sacsayhuamán | 104.9804 |
| Casa de mis padres ↔ Plaza de Armas | 105.7550 |
| UNSAAC ↔ Casa de mis padres | 107.8049 |
| Mi casa ↔ Casa de mis padres | 112.8946 |

- **Par más cercano:** Sacsayhuamán y la Plaza de Armas, a unos **0.85 km**. Son dos lugares del casco histórico, uno sobre la ciudad y el otro en su centro.
- **Par más lejano:** Mi casa y la casa de mis padres, a unos **112.89 km**. Mi casa es el punto más al sureste y la casa de mis padres el más al noroeste, así que están en extremos opuestos de mi conjunto de lugares.

Estas distancias son en línea recta sobre la superficie de la Tierra, no por carretera ni por calle. Por eso el recorrido real entre dos lugares, por ejemplo de la Plaza de Armas a Sacsayhuamán (que queda cuesta arriba), es más largo. Además, Sacsayhuamán es un complejo grande y lo guardé como un solo punto, así que la distancia cambiaría si marcara otra parte del complejo.

## (c) Respuesta a la pregunta de cierre sobre CRS

Si le paso mis coordenadas a un compañero sin indicar el CRS, él no sabrá en qué sistema están. Las mías están en grados de latitud y longitud (EPSG:4326), por ejemplo -13.52, -71.95, mientras que su GPS en UTM entrega números en metros, mucho más grandes. Si su programa lee mis grados como si fueran metros, o al revés, los puntos caerían en otro lugar del mundo o no se alinearían con sus datos. Esa es la trampa del CRS que vimos en la teoría sobre EPSG: dos conjuntos de coordenadas pueden parecer parecidos y representar lugares totalmente distintos. En mi caso, además, mis lugares caen en dos zonas UTM diferentes (19S para Cusco y 18S para la casa de mis padres), así que ni siquiera bastaría decir "UTM": habría que indicar el código EPSG exacto. Para evitar el problema, hay que enviar el código EPSG junto con los datos y reproyectar todo a un mismo CRS antes de combinarlos.
