<template>
  <div v-if="selectedHotel" class="product-details">
    <div class="product-image">
      <img :src="selectedHotel.images[currentImageIndex]" class="car-image" alt="Hotel Image">
      <div class="carousel-buttons">
        <button @click="prevImage">&#10094;</button>
        <button @click="nextImage">&#10095;</button>
      </div>
    </div>
    <div class="product-info">
      <div class="header">
        <div class="logo-container">
          <img :src="selectedHotel.logoImage" class="logo" alt="Company Logo">
        </div>
        <div class="title-info">
          <div class="title">{{ selectedHotel.title }}</div>
          <div class="model">{{ selectedHotel.model }}</div>
          <div class="price">
            {{ selectedHotel.pricePerDay }}
            <span>Después de 3 días rentado</span>
            <div class="stars">
              <span v-for="star in filledStars" :key="star">&#9733;</span>
              <span v-for="star in emptyStars" :key="star" class="empty">&#9733;</span>
            </div>
          </div>
        </div>
      </div>
      <div class="details">
        <p><strong>Brand:</strong> {{ selectedHotel.brand }}</p>
        <p><strong>Type:</strong> {{ selectedHotel.type }}</p>
        <p><strong>Cities:</strong> {{ selectedHotel.cities.join(', ') }}</p>
        <p><strong>Description:</strong> {{ selectedHotel.description }}</p>
        <p><strong>Services:</strong></p>
        <ul>
          <li v-for="service in selectedHotel.services" :key="service.name" class="service">
            <img :src="service.icon" alt="Service Icon" /> {{ service.name }}
          </li>
        </ul>
      </div>
      <div class="map">
        <iframe :src="selectedHotel.mapSrc" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
    </div>
  </div>
  <div v-else>
    <p>No hay hotel seleccionado.</p>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from 'vue';
import { useCountryStore } from '../../store/country';

export default defineComponent({
  name: 'HotelOrdenar',
  setup() {
    const store = useCountryStore();
    const selectedHotel = computed(() => store.selectedHotel);
    const currentImageIndex = ref(0);

    const prevImage = () => {
      if (selectedHotel.value) {
        currentImageIndex.value = (currentImageIndex.value - 1 + selectedHotel.value.images.length) % selectedHotel.value.images.length;
      }
    };

    const nextImage = () => {
      if (selectedHotel.value) {
        currentImageIndex.value = (currentImageIndex.value + 1) % selectedHotel.value.images.length;
      }
    };

    const filledStars = computed(() => {
      return selectedHotel.value ? Math.floor(selectedHotel.value.rating) : 0;
    });

    const emptyStars = computed(() => {
      return selectedHotel.value ? 5 - Math.floor(selectedHotel.value.rating) : 5;
    });

    return {
      selectedHotel,
      currentImageIndex,
      prevImage,
      nextImage,
      filledStars,
      emptyStars
    };
  }
});
</script>

<style scoped>
body {
  font-family: 'Arial', sans-serif;
  background-color: rgb(255, 255, 255);
  margin: 0;
  padding: 0;
}

.product-details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-bottom: 20px;
  padding: 20px;
}

.product-image {
  flex: 1 1 60%;
  position: relative;
  margin-top: 10px;
}

.product-image img {
  width: 100%;
  border-radius: 10px;
}

.carousel-buttons {
  position: absolute;
  top: 50%;
  width: 100%;
  display: flex;
  justify-content: space-between;
  transform: translateY(-50%);
}

.carousel-buttons button {
  background-color: rgba(187, 178, 178, 0.5);
  border: none;
  color: white;
  padding: 10px;
  cursor: pointer;
}

.product-info {
  flex: 1 1 35%;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.54);
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(255, 255, 255, 0.1);
}

.header {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
}

.logo-container {
  width: 100px;
  height: 100px;
  gap: 10px;
}

.logo {
  width: 100%;
  height: auto;
}

.title-info {
  text-align: left;
}

.title {
  font-size: 24px;
  font-weight: bold;
  color: rgb(255, 255, 255);
}

.model {
  font-size: 18px;
  color: rgb(255, 255, 255);
}

.price {
  font-size: 18px;
  margin-bottom: 10px;
  color: rgb(255, 255, 255);
}

.stars {
  margin-bottom: 10px;
}

.stars span {
  font-size: 2em;
  color: gold;
}

.stars .empty {
  color: lightgray;
}

.details {
  width: 100%;
}

.detail {
  background-color: #f0f0f0;
  border-radius: 5px;
  margin-bottom: 10px;
  padding: 10px;
  text-align: center;
}

.rental-details {
  margin-bottom: 10px;
}

.detail-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  display: block;
  margin: 10px auto;
}

.detail-btn:hover {
  background-color: #0056b3;
}

.city-list {
  list-style-type: none;
  padding: 0;
  text-align: center;
}

.city-item {
  margin: 5px 0;
}

.buttons {
  display: flex;
  justify-content: center;
}

.add-btn {
  background-color: #28a745;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.add-btn:hover {
  background-color: #218838;
}

.add-btn i {
  margin-left: 10px;
}

.product-description-grid {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin: 20px;
}

.description,
.map-container {
  flex: 1 1 48%;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgb(255, 255, 255);
  padding: 20px;
  height: 300px;
}

.description h2,
.description p {
  margin-top: -10px;
}

.map-container iframe {
  width: 100%;
  height: 100%;
  border-radius: 10px;
}

.popular-services {
  font-family: Arial, sans-serif;
}

.services {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.service {
  display: flex;
  align-items: center;
  gap: 5px;
}

.service i {
  color: rgb(45, 211, 45);
}
</style>
