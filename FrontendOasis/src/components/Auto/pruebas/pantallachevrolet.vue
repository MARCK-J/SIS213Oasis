<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chevrolet</title>
    <style>
        /* Estilos generales para el cuerpo del documento */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Estilos para el encabezado que contiene la imagen grande y el texto */
        .header {
            position: relative;
            text-align: center;
            color: white;
        }

        /* Estilos para la imagen grande del encabezado */
        .header img {
            width: 100%;
            height: auto;
        }

        /* Estilos para el contenido superpuesto en la imagen del encabezado */
        .header .content {
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .header .content h1 {
            font-size: 3em;
            margin: 0;
        }

        .header .content p {
            font-size: 1.5em;
        }

        /* Estilos para el botón en el encabezado */
        .header .content .btn {
            background-color: #d81b60;
            color: white;
            padding: 1em 2em;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1.2em;
        }

        /* Estilos para la cuadrícula de autos */
        .car-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        /* Estilos para las imágenes de los autos */
        .car-grid img {
            width: 100%;
            height: auto;
            display: block;
            cursor: pointer;
        }

        /* Estilos para cada elemento de la cuadrícula de autos */
        .car-grid .car {
            text-align: center;
        }

        /* Estilos para los botones de los nombres de los autos */
        .car-grid .car button {
            background-color: transparent;
            border: none;
            font-size: 1.1em;
            cursor: pointer;
            margin-top: 10px;
            color: #333;
        }
    </style>
</head>
<body>
    <div id="app">
        <!-- Sección del encabezado con la imagen grande y el texto -->
        <div class="header">
            <!-- Aquí puedes cambiar la URL de la imagen del encabezado -->
            <img src="https://wallpapercave.com/wp/1DcAB24.jpg" alt="">
            <div class="content">
                <h1></h1>
                <p></p>
                <!-- Aquí puedes cambiar el enlace del botón -->
                <a href="#" class="btn">Descúbrela</a>
            </div>
        </div>
        <!-- Cuadrícula de autos -->
        <div class="car-grid">
            <!-- Iteración sobre cada auto usando Vue.js -->
            <div class="car" v-for="car in cars" :key="car.name">
                <!-- Cada imagen de auto es un enlace -->
                <a :href="car.link">
                    <!-- Aquí puedes cambiar la URL de la imagen de cada auto -->
                    <img :src="car.image" :alt="car.name">
                </a>
                <!-- Cada nombre de auto es un botón que también es un enlace -->
                <a :href="car.link">
                    <button>{{ car.name }}</button>
                </a>
            </div>
        </div>
    </div>

    <!-- Inclusión de la biblioteca Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script>
        new Vue({
            el: '#app',
            data: {
                cars: [
                    // Datos de los autos, incluyendo el nombre, la URL de la imagen y el enlace
                    { name: 'Onix', image: 'https://imcruzcenter.com.bo/grtadmin/imagenes/newonix2020.jpg', link: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MTS18,$PN01,$WS90,$IBE00&view=FRONT34&model=ms&size=1920&bkba_opt=2&crop=0,0,0,0&' },
                    { name: 'Onix RS', image: 'https://imcruzcenter.com.bo/grtadmin/imagenes/chevrolet-new-onix-rs-2021.jpg', link: 'https://example.com/qashqai' },
                    { name: 'Tracker', image: 'https://derco-store-bo-dev.s3.amazonaws.com/cars_por_version/chevrolet-new-tracker-ls-rojo.jpg', link: 'https://example.com/xtrail' },
                    { name: 'Captiva', image: 'https://derco-store-bo-dev.s3.amazonaws.com/cars_por_version/chevrolet-new-captiva-lt-rojo.jpg', link: 'https://example.com/murano' },
                    { name: 'Montana', image: 'https://derco-store-bo-dev.s3.amazonaws.com/cars_por_version/chevrolet-montana-lt-gris.jpg', link: 'https://example.com/patrol' },
                    { name: 'Blazer', image: 'https://derco-store-bo-dev.s3.amazonaws.com/cars_por_version/chevrolet-blazer-rs-rojo.jpg', link: 'https://example.com/patrolv8' },
                    { name: 'Tahoe', image: 'https://derco-store-bo-dev.s3.amazonaws.com/cars_por_version/chevrolet-new-tahoe-z71-blanco-nevado.jpg', link: 'https://example.com/pathfinder' }
                ]
            }
        });
    </script>
</body>
</html>
