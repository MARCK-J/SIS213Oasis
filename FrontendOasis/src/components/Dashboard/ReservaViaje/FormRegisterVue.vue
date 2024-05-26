<template>
  <div class="dashboard">
    <h1 class="h1">Formulario de Agencia de Viajes</h1>

    <section class="section">
      <h2>Hotel</h2>
      <button @click="showHotelModal = true">Seleccionar Hotel</button>
      <div v-if="selectedHotel" class="panel">
        <h3>Hotel Seleccionado</h3>
        <div class="info">
          <div class="column">
            <p><strong>ID:</strong> {{ selectedHotel.idReservaHotel }}</p>
            <p><strong>Nro Reserva:</strong> {{ selectedHotel.nroReservaHotel }}</p>
            <p><strong>Fecha Inicio:</strong> {{ selectedHotel.fechaInicio }}</p>
            <p><strong>Fecha Fin:</strong> {{ selectedHotel.fechaFin }}</p>
            <p><strong>Hotel:</strong> {{ selectedHotel.hotel }}</p>
            <p><strong>Precio:</strong> {{ selectedHotel.precio }}</p>
          </div>
          <div class="column">
            <p><strong>Personas:</strong> {{ selectedHotel.personas }}</p>
            <p><strong>Habitaciones:</strong> {{ selectedHotel.habitaciones }}</p>
            <p><strong>Ciudad:</strong> {{ selectedHotel.ciudad }}</p>
            <p><strong>País:</strong> {{ selectedHotel.pais }}</p>
            <p><strong>Detalle:</strong> {{ selectedHotel.detalle }}</p>
          </div>
        </div>
      </div>
    </section>

    <section>
      <h2>Vuelo</h2>
      <button @click="showFlightModal = true">Seleccionar Vuelo</button>
      <div v-if="selectedFlight" class="panel">
        <h3>Vuelo Seleccionado</h3>
        <div class="info">
          <div class="column">
            <p><strong>ID:</strong> {{ selectedFlight.idViaje }}</p>
            <p><strong>Nro Reserva:</strong> {{ selectedFlight.nroReserva }}</p>
            <p><strong>Origen:</strong> {{ selectedFlight.ciudad_origen }} - {{ selectedFlight.pais_origen }}</p>
            <p><strong>Destino:</strong> {{ selectedFlight.ciudad_destino }} - {{ selectedFlight.pais_destino }}</p>
            <p><strong>Aerolínea:</strong> {{ selectedFlight.aerolinea }}</p>
          </div>
          <div class="column">
            <p><strong>Fecha Inicio:</strong> {{ selectedFlight.fechaInicio }}</p>
            <p><strong>Fecha Fin:</strong> {{ selectedFlight.fechaFin }}</p>
            <p><strong>Precio:</strong> {{ selectedFlight.precio }}</p>
            <p><strong>Personas:</strong> {{ selectedFlight.personas }}</p>
          </div>
        </div>
      </div>
    </section>

    <section>
      <h2>Alquiler de Auto</h2>
      <button @click="showCarModal = true">Seleccionar Auto</button>
      <div v-if="selectedCar" class="panel">
        <h3>Auto Seleccionado</h3>
        <div class="info">
          <div class="column">
            <p><strong>ID:</strong> {{ selectedCar.idAlquiler }}</p>
            <p><strong>Empresa:</strong> {{ selectedCar.empresa }}</p>
            <p><strong>Marca:</strong> {{ selectedCar.marca }}</p>
            <p><strong>Modelo:</strong> {{ selectedCar.modelo }}</p>
            <p><strong>Tipo:</strong> {{ selectedCar.tipo }}</p>
          </div>
          <div class="column">
            <p><strong>Días:</strong> {{ selectedCar.dias }}</p>
            <p><strong>Precio:</strong> {{ selectedCar.precio }}</p>
            <p><strong>Ciudad:</strong> {{ selectedCar.ciudad }}</p>
            <p><strong>País:</strong> {{ selectedCar.pais }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Modales -->
    <modal :isOpen="showHotelModal" @close="showHotelModal = false">
      <hotel-list :reservaHoteles="reservaHoteles" @select-hotel="selectHotel"></hotel-list>
    </modal>

    <modal :isOpen="showFlightModal" @close="showFlightModal = false">
      <flight-list :vuelos="vuelos" @select-flight="selectFlight"></flight-list>
    </modal>

    <modal :isOpen="showCarModal" @close="showCarModal = false">
      <car-list :alquileresAuto="alquileresAuto" @select-car="selectCar"></car-list>
    </modal>
  </div>
</template>

<script>
import HotelList from './HotelList.vue';
import FlightList from './FlightList.vue';
import CarList from './CarList.vue';
import ClientForm from './ClientForm.vue';
import Modal from './Modal.vue';

export default {
  name: "FormRegisterVue",
  components: {
    HotelList,
    FlightList,
    CarList,
    ClientForm,
    Modal
  },
  data() {
    return {
      showHotelModal: false,
      showFlightModal: false,
      showCarModal: false,
      reservaHoteles: [
        {
          idReservaHotel: 1,
          nroReservaHotel: 'R001',
          fechaInicio: '2024-06-01',
          fechaFin: '2024-06-10',
          hotel: 'Hotel Plaza',
          precio: 500,
          personas: 2,
          habitaciones: 1,
          ciudad: 'Madrid',
          pais: 'España',
          detalle: 'Habitación con vista al mar'
        },
        {
          idReservaHotel: 2,
          nroReservaHotel: 'R002',
          fechaInicio: '2024-07-01',
          fechaFin: '2024-07-15',
          hotel: 'Hotel Continental',
          precio: 800,
          personas: 4,
          habitaciones: 2,
          ciudad: 'Barcelona',
          pais: 'España',
          detalle: 'Suite con desayuno incluido'
        }
      ],
      vuelos: [
        {
          idViaje: 1,
          nroReserva: 'V001',
          ciudad_origen: 'Madrid',
          pais_origen: 'España',
          ciudad_destino: 'Nueva York',
          pais_destino: 'EEUU',
          aerolinea: 'Iberia',
          fechaInicio: '2024-06-01',
          fechaFin: '2024-06-10',
          precio: 1000,
          personas: 2
        },
        {
          idViaje: 2,
          nroReserva: 'V002',
          ciudad_origen: 'Barcelona',
          pais_origen: 'España',
          ciudad_destino: 'Tokio',
          pais_destino: 'Japón',
          aerolinea: 'ANA',
          fechaInicio: '2024-07-01',
          fechaFin: '2024-07-15',
          precio: 1500,
          personas: 4
        }
      ],
      alquileresAuto: [
        {
          idAlquiler: 1,
          empresa: 'Avis',
          marca: 'Toyota',
          modelo: 'Corolla',
          tipo: 'Sedan',
          dias: 10,
          precio: 300,
          ciudad: 'Madrid',
          pais: 'España'
        },
        {
          idAlquiler: 2,
          empresa: 'Hertz',
          marca: 'BMW',
          modelo: 'X5',
          tipo: 'SUV',
          dias: 5,
          precio: 500,
          ciudad: 'Barcelona',
          pais: 'España'
        }
      ],
      selectedHotel: null,
      selectedFlight: null,
      selectedCar: null,
      client: null
    };
  },
  methods: {
    selectHotel(hotel) {
      this.selectedHotel = hotel;
      this.showHotelModal = false;
    },
    selectFlight(flight) {
      this.selectedFlight = flight;
      this.showFlightModal = false;
    },
    selectCar(car) {
      this.selectedCar = car;
      this.showCarModal = false;
    },
    saveClient(client) {
      this.client = client;
    }
  }
};
</script>

<style>

.h1 {
  color: black;
  font-weight: bold;
}

.section {
  margin: 20px 0;
}

.panel {
  border: 1px solid #ddd;
  padding: 20px;
  margin-top: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  max-width: 600px;
}

.info {
  display: flex;
  justify-content: space-between;
}

.column {
  flex: 1;
  padding: 10px;
}

.column p {
  margin: 5px 0;
}

.column p strong {
  color: #555;
}

.dashboard {
  width: 70%;
  margin: 0;
  text-align: left;
}

</style>
