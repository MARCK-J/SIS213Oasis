<!-- Sidebar.vue -->
<template>
	<div>
	  <div class="hamburger" @click="toggleSidebar">☰</div>
	  <div :class="['sidebar', { 'sidebar-hidden': !isSidebarVisible, 'sidebar-visible': isSidebarVisible }]">
		<ul>
		  <li @click="selectOption('admin')">Administrador</li>
		  <li @click="selectOption('flights')">Vuelos</li>
		  <li @click="selectOption('hotels')">Hoteles</li>
		  <li @click="selectOption('cars')">Autos</li>
		</ul>
	  </div>
	</div>
  </template>
  
  <script>
  export default {
	data() {
	  return {
		isSidebarVisible: true
	  }
	},
	methods: {
	  toggleSidebar() {
		this.isSidebarVisible = !this.isSidebarVisible;
	  },
	  selectOption(option) {
		this.$emit('optionSelected', option);
		if (window.innerWidth < 760) {
		  this.isSidebarVisible = false;
		}
	  }
	}
  }
  </script>
  
  <style scoped>
  .sidebar {
	width: 100%;
	transition: transform 0.3s ease;
  }
  
  .sidebar-hidden {
	transform: translateX(-100%);
  }
  
  .sidebar-visible {
	transform: translateX(0);
  }
  
  .sidebar ul {
	list-style-type: none;
	padding: 0;
  }
  
  .sidebar li {
	cursor: pointer;
	display: flex;
	justify-content: center;
  }
  
  .hamburger {
	display: none;
	font-size: 30px;
	cursor: pointer;
	padding: 10px;
  }
  
  </style>
  