<template>
	<div>
	  <div class="hamburger" @click="toggleMySidebar">☰</div>
	  <div :class="['MySidebar', { 'MySidebar-hidden': !isMySidebarVisible, 'MySidebar-visible': isMySidebarVisible }]">
		<h4>Bienvenido Administrador</h4>
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
		isMySidebarVisible: true
	  }
	},
	methods: {
	  toggleMySidebar() {
		this.isMySidebarVisible = !this.isMySidebarVisible;
	  },
	  selectOption(option) {
		this.$emit('optionSelected', option);
		if (window.innerWidth < 760) {
		  this.isMySidebarVisible = false;
		}
	  }
	}
  }
  </script>
  
  <style scoped>
  .MySidebar {
	width: 100%;
	background-color: wheat;
	transition: transform 0.3s ease;
	display: flex;
	justify-content: center;
	flex-direction: column;
  }
  
  .MySidebar-hidden {
	transform: translateX(-100%);
  }
  
  .MySidebar-visible {
	transform: translateX(0);
  }
  
  .MySidebar ul {
	list-style-type: none;
	padding: 0;
  }
  
  .MySidebar li {
	cursor: pointer;
	display: flex;
	justify-content: center;
	border: 1px solid black;
	padding: 10px 10px;
  }
  
  .hamburger {
	display: none;
	font-size: 30px;
	cursor: pointer;
	padding: 10px;
  }
  
  @media (max-width: 760px) {
	.hamburger {
	  display: block;
	}
	
	.MySidebar {
	  width: 100%;
	}
  }
  </style>
  