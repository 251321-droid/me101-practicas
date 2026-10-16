# Resumen Tema 7: Procesamiento de imágenes con Python

## (a) Figuras dibujadas
Mi imagen es de 120x120 píxeles con fondo crema (240, 230, 200).
Dibujé un rectángulo rojo (220, 30, 30) y un círculo azul (30, 90, 200).

## (b) Comparación convert('L') vs. rgb2gray()
En el píxel de fondo (5, 5), Pillow con convert('L') dio 230 y scikit-image
con rgb2gray() dio 229.96 al multiplicarlo por 255. Casi coinciden, pero no
son idénticos: cada librería usa pesos distintos para R, G y B, y Pillow
redondea a un entero mientras que scikit-image conserva decimales.

## (c) Umbral de Otsu
El umbral de Otsu fue 0.3334 (unos 85 en escala 0-255). El 88.33 % de los
píxeles quedó por encima del umbral (True). Solo el rectángulo rojo quedó
por debajo; el fondo y el círculo azul quedaron por encima.