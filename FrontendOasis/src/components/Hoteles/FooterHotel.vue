<template>
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h3>Contacto</h3>
          <p>Email: ejemplo@apple.com</p>
          <p>Teléfono: +1234567890</p>
        </div>
        <div class="footer-section">
          <h3>Enlaces</h3>
          <ul>
            <li><a href="#">Inicio</a></li>
            <li><a href="#">Productos</a></li>
            <li><a href="#">Servicios</a></li>
            <li><a href="#">Contacto</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3>Redes Sociales</h3>
          <ul>
            <li><a href="#">Facebook</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#">Instagram</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2024 Todos los derechos reservados. Oasis.</p>
      </div>
    </footer>
  </template>
  
  <style scoped>
  .footer {
    background-color: #f6f6f6;
    padding: 30px 0;
    border-top: 1px solid #e0e0e0;
  }
  
  .footer-content {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
  }
  
  .footer-section {
    flex: 1;
    margin-right: 40px;
  }
  
  .footer-section h3 {
    font-size: 20px;
    margin-bottom: 15px;
    color: #333;
  }
  
  .footer-section p {
    font-size: 16px;
    margin-bottom: 10px;
    color: #666;
  }
  
  .footer-section ul {
    list-style-type: none;
    padding: 0;
  }
  
  .footer-section ul li {
    margin-bottom: 10px;
  }
  
  .footer-section ul li a {
    color: #4a90e2;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s ease;
  }
  
  .footer-section ul li a:hover {
    color: #3079ed;
  }
  
  .footer-bottom {
    margin-top: 30px;
    text-align: center;
    color: #888;
    font-size: 14px;
  }
  </style>
  