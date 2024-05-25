<template>
	<div>
	  <button
		id="custom-button"
		class="navbar-toggler d-md-none"
		type="button"
		@click="isSidebarOpen = !isSidebarOpen"
	  >
		<span class="navbar-toggler-icon"></span>
	  </button>
	  <div :class="['sidebar-container', { 'collapsed': !isSidebarOpen }]">
		<nav class="sidebar">
		  <ul class="nav flex-column">
			<li class="nav-item">
			  <div class="nav-link" @click="selectOption('admin')">Administrador</div>
			</li>
			<li class="nav-item">
			  <div class="nav-link" @click="selectOption('hotels')">Hoteles</div>
			</li>
			<li class="nav-item">
			  <div class="nav-link" @click="selectOption('flights')">Vuelos</div>
			</li>
			<li class="nav-item">
			  <div class="nav-link" @click="selectOption('cars')">Autos</div>
			</li>
			<li class="nav-item">
			  <div class="nav-link" @click="selectOption('configurations')">Configuraciones</div>
			</li>
		  </ul>
		</nav>
	  </div>
	</div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref, onMounted, onBeforeUnmount } from 'vue';
  
  export default defineComponent({
	name: "Sidebar",
	emits: ['optionSelected'],
	setup(props, { emit }) {
	  const isSidebarOpen = ref(false);
  
	  const handleResize = () => {
		if (window.innerWidth >= 768) {
		  isSidebarOpen.value = true;
		} else {
		  isSidebarOpen.value = false;
		}
	  };
  
	  const selectOption = (option) => {
		emit('optionSelected', option);
		if (window.innerWidth < 768) {
		  isSidebarOpen.value = false;
		}
	  };
  
	  onMounted(() => {
		window.addEventListener('resize', handleResize);
		handleResize();
	  });
  
	  onBeforeUnmount(() => {
		window.removeEventListener('resize', handleResize);
	  });
  
	  return {
		isSidebarOpen,
		selectOption,
	  };
	},
  });
  </script>
  
  <style scoped>
  .sidebar-container {
	display: flex;
	flex-direction: column;
	width: 250px;
	height: 100vh;
	background-color: black;
	transition: transform 0.3s ease;
	position: fixed;
	z-index: 1000;
  }
  .sidebar-container.collapsed {
	transform: translateX(-100%);
  }
  .sidebar {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
  }
  .sidebar-header {
	margin-bottom: 20px;
  }
  .nav {
	width: 100%;
  }
  .nav-item {
	width: 100%;
  }
  .nav-link {
	color: #fff;
	padding: 10px 15px;
	width: 100%;
	text-align: left;
	cursor: pointer;
  }
  .nav-link:hover {
	color: #939292;
  }
  #custom-button {
	background-color: rgb(84, 84, 239);
    border: 1px solid black;
    margin: 10px 20px;
  }
  </style>
  