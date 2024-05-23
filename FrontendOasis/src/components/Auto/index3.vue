<template>
  <div id="app" class="container">
    <!-- Contenedor de la imagen con botones de navegación -->
    <div class="image-container">
      <button class="nav-button left" @click="prevOption">&#9664;</button>
      <img class="car-image" :src="selectedOption.image" alt="Tesla Model 3">
      <button class="nav-button right" @click="nextOption">&#9654;</button>
    </div>
    <!-- Contenedor de detalles del coche -->
    <div class="details">
      <div class="header">
        <img src="https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png" alt="Tesla Logo">
        <div class="info">
          <div class="title">Model 3</div>
          <div>Entrega Estimada: jun. - jul. 2024</div>
        </div>
      </div>
      <div class="price">
        {{ selectedOption.price }} <span>Después de ahorros posibles*</span>
      </div>
      <div class="options">
        <div class="option-group">
          <h3>Pintura</h3>
          <div
              v-for="option in paintOptions"
              :key="option.color"
              :class="['option', { selected: option.color === selectedPaint.color }]"
              @click="selectPaint(option)"
          >
            <img :src="option.image" alt="">
            <div class="info">
              <div class="type">{{ option.color }}</div>
              <div class="price">{{ option.price }}</div>
            </div>
          </div>
        </div>
        <div class="option-group">
          <h3>Rines</h3>
          <div
              v-for="option in wheelOptions"
              :key="option.type"
              :class="['option', { selected: option.type === selectedWheel.type }]"
              @click="selectWheel(option)"
          >
            <img :src="option.image" alt="">
            <div class="info">
              <div class="type">{{ option.type }}</div>
              <div class="details">{{ option.details }}</div>
              <div class="price">{{ option.price }}</div>
            </div>
          </div>
        </div>
        <!-- Puedes agregar más opciones aquí -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // Opciones del coche (carrusel)
      options: [
        {
          type: 'Rear-Wheel Drive',
          price: '$39.900.000',
          displayPrice: '$35.269.000',
          range: '513 km',
          acceleration: '6,1 s',
          maxSpeed: '201 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT351,$PPSW,$W38A,$IPB2&view=STUD_FRONT34&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        },
        {
          type: 'Long Range',
          price: '$44.900.000',
          displayPrice: '$40.269.000',
          range: '629 km',
          acceleration: '4,4 s',
          maxSpeed: '233 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT351,$PPSW,$W38A,$IPB2&view=STUD_SIDEVIEW&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        },
        {
          type: 'Performance',
          price: '$49.900.000',
          displayPrice: '$45.269.000',
          range: '528 km',
          acceleration: '3,1 s',
          maxSpeed: '261 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT353,$PPSW,$W30P,$IPB4&view=STUD_REAR34&model=m3&size=1920&bkba_opt=2&crop=0,0,0,0&'
        },
        {
          type: 'Performance',
          price: '$49.900.000',
          displayPrice: '$45.269.000',
          range: '528 km',
          acceleration: '3,1 s',
          maxSpeed: '261 km/h',
          image: 'https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MT353,$PPSW,$W30P,$IPB4&view=STUD_RIMCLOSEUP&model=m3&size=1920&bkba_opt=2&crop=0,0,80,0&'
        }
      ],
      // Opciones de pintura
      paintOptions: [
        { color: 'Pearl White Multi-Coat', price: 'Incluido', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_white.png' },
        { color: 'Solid Black', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_black.png' },
        { color: 'Midnight Silver Metallic', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_silver.png' },
        { color: 'Deep Blue Metallic', price: '$1.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_blue.png' },
        { color: 'Red Multi-Coat', price: '$2.500.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_colors_red.png' },
      ],
      // Opciones de rines
      wheelOptions: [
        { type: 'Rines Photon de 18"', details: 'Neumáticos para todas las estaciones\nAutonomía (est.): 554 km', price: 'Incluido', image: 'https://www.tesla.com/ns_videos/model-3_order_page_wheels_silver.png' },
        { type: 'Rines Sport de 19"', details: 'Neumáticos para verano\nAutonomía (est.): 547 km', price: '$1.700.000', image: 'https://www.tesla.com/ns_videos/model-3_order_page_wheels_sport.png' }
      ],
      selectedOptionIndex: 0, // Índice de la opción seleccionada del coche
      selectedPaint: null, // Opción de pintura seleccionada
      selectedWheel: null // Opción de rines seleccionada
    };
  },
  computed: {
    selectedOption() {
      return this.options[this.selectedOptionIndex];
    }
  },
  methods: {
    selectOption(option) {
      this.selectedOptionIndex = this.options.indexOf(option);
    },
    prevOption() {
      this.selectedOptionIndex = (this.selectedOptionIndex - 1 + this.options.length) % this.options.length;
    },
    nextOption() {
      this.selectedOptionIndex = (this.selectedOptionIndex + 1) % this.options.length;
    },
    selectPaint(paint) {
      this.selectedPaint = paint;
    },
    selectWheel(wheel) {
      this.selectedWheel = wheel;
    }
  },
  mounted() {
    // Selecciona la primera opción de pintura y rines por defecto
    this.selectedPaint = this.paintOptions[0];
    this.selectedWheel = this.wheelOptions[0];
  }
};
</script>
    <style scoped>
        /* Reseteo de márgenes y padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        /* Configuración del cuerpo de la página */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            background-color: #f5f5f5;
        }
        /* Contenedor principal */
        .container {
            display: flex;
            width: 100%;
            height: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        /* Contenedor de la imagen del coche */
        .image-container {
            position: relative;
            width: 130%; /* Ocupa la mitad izquierda de la pantalla */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /* Imagen del coche */
        .car-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        /* Botones de navegación del carrusel */
        .nav-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(255, 255, 255, 0.7);
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 24px;
            z-index: 1;
        }
        .nav-button.left {
            left: 10px;
        }
        .nav-button.right {
            right: 10px;
        }
        /* Contenedor de detalles */
        .details {
            width: 50%; /* Ocupa la mitad derecha de la pantalla */
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow-y: auto; /* Permite desplazamiento vertical */
        }
        /* Estilo del encabezado */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        .header img {
            width: 100px;
        }
        .header .info {
            text-align: right;
        }
        .header .info .title {
            font-size: 24px;
            font-weight: bold;
        }
        /* Estilo del precio */
        .price {
            font-size: 24px;
            font-weight: bold;
            margin: 20px 0;
        }
        .price span {
            color: #888;
            font-size: 18px;
        }
        /* Contenedor de opciones */
        .options {
            display: flex;
            flex-direction: column;
            gap: 20px; /* Separación entre grupos de opciones */
        }
        .option-group {
            margin-bottom: 20px;
        }
        /* Estilo de cada opción */
        .option {
            display: flex;
            align-items: center;
            gap: 10px; /* Separación entre icono y texto */
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
        }
        .option.selected {
            border-color: #3b82f6;
            background-color: #f0f9ff;
        }
        .option img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .option .info {
            flex-grow: 1;
        }
        .option .info .type {
            font-size: 18px;
            font-weight: bold;
        }
        .option .info .price {
            font-size: 18px;
            color: #333;
        }
        .option .info .details {
            font-size: 14px;
            color: #666;
        }
        /* Estilo responsivo para pantallas pequeñas */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            .image-container {
                width: 100%;
                height: 50%; /* Ocupa la mitad superior de la pantalla */
            }
            .details {
                width: 100%;
                height: 50%; /* Ocupa la mitad inferior de la pantalla */
                padding: 10px;
            }
            .nav-button {
                font-size: 18px;
                padding: 8px;
            }
        }
    </style>
