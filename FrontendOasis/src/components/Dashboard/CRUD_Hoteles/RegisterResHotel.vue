<template>

  <div class="reservation" v-if="show">
    <div >
      <span class="close-button" @click="closeModal">&times;</span>
      <div class="reservation-title">Reserva</div>
      <div>
        <label for="checkin">Entrada:</label>
        <input type="date" id="checkin" v-model="reservation.checkin">
      </div>
      <div>
        <label for="checkout">Salida:</label>
        <input type="date" id="checkout" v-model="reservation.checkout">
      </div>
      <div>
        <label for="rooms">Número de habitaciones:</label>
        <input type="number" id="rooms" min="1" v-model.number="reservation.rooms">
      </div>
      <div>
        <label for="guests">Número de personas:</label>
        <input type="number" id="guests" min="1" v-model.number="reservation.guests">
      </div>
      <div>
        <label for="details">Detalle:</label>
        <input type="text" id="details" v-model="reservation.details">
      </div>
      <div>
        <label for="price">Precio:</label>
        <input type="text" id="price" v-model="reservation.price" @input="validatePrice">
      </div>
      <button class="cart-button" @click="addToCart">
        Añadir al carrito
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: ['show'],
  data() {
    return {
      reservation: {
        checkin: '',
        checkout: '',
        rooms: 1,
        guests: 1,
        details: '',
        price: ''
      }
    };
  },
  methods: {
    validatePrice(event) {
      const value = event.target.value;
      const regex = /^\d*\.?\d{0,2}$/;
      if (!regex.test(value)) {
        event.target.value = value.slice(0, -1);
      } else {
        this.reservation.price = value;
      }
    },
    addToCart() {
      // Handle adding to cart
      alert('Añadido al carrito');
    },

    closeModal() {
      this.$emit('close');
    },
  }
};
</script>

<style scoped>
.reservation {
  margin-top: 20px;
  text-align: left;
  max-width: 700px;
  margin: 50px auto;
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  position: relative;
  justify-content: center;
}

.modal-content {

  background-color: white;
  padding: 20px;
  border-radius: 5px;
  overflow: auto; /* Agrega scroll si es necesario */
  max-height: 80vh; /* Limita la altura del modal al 80% de la altura de la ventana */
}

.reservation-title {
  font-size: 1.5em;
  margin-bottom: 10px;
  text-align: center;
}

.reservation div {
  margin-bottom: 10px;
}

.reservation label {
  font-weight: bold;
  margin-right: 10px;
}

.reservation input[type="date"],
.reservation input[type="number"],
.reservation input[type="text"] {
  padding: 5px;
  font-size: 1em;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.reservation input[type="number"] {
  width: 100px;
}

.cart-button {
  position: absolute;
  bottom: 20px;
  right: 20px;
  background-color: #ff9800;
  border: none;
  border-radius: 5px;
  color: white;
  padding: 10px;
  cursor: pointer;
  display: flex;
  align-items: center;
}

.cart-button img {
  width: 20px;
  height: auto;
  margin-right: 5px;
}

@media (max-width: 768px) {
  .reservation {
    padding: 10px;
  }

  .cart-button {
    bottom: 10px;
    right: 10px;
    padding: 8px;
  }
}

@media (max-width: 480px) {
  .reservation input[type="date"],
  .reservation input[type="number"],
  .reservation input[type="text"] {
    font-size: 0.9em;
  }

  .cart-button {
    padding: 5px;
  }
}
</style>
