
INSERT INTO Pais (pais)
VALUES 
    ('Bolivia'); 
	
select * from pais;


INSERT INTO Ciudad (ciudad, Pais_idPais)
VALUES 
    ('La Paz', 1),  -- Departamento: La Paz
    ('Santa Cruz de la Sierra', 1),  -- Departamento: Santa Cruz
    ('Cochabamba', 1),  -- Departamento: Cochabamba
    ('Sucre', 1),  -- Departamento: Chuquisaca
    ('Oruro', 1),  -- Departamento: Oruro
    ('Potosí', 1),  -- Departamento: Potosí
    ('Tarija', 1),  -- Departamento: Tarija
    ('Beni', 1),  -- Departamento: Beni
    ('Pando', 1);  -- Departamento: Pando

-- Eliminar todos los datos de la tabla Ciudad
DELETE FROM Ciudad;

-- Reiniciar la secuencia asociada a la columna idCiudad
ALTER SEQUENCE ciudad_idciudad_seq RESTART WITH 1;

SELECT setval('idCiudad', 1, false);


select * from Ciudad

INSERT INTO CategoriaHotel (categoria) VALUES ('Hotel');
INSERT INTO CategoriaHotel (categoria) VALUES ('Hostal');
INSERT INTO CategoriaHotel (categoria) VALUES ('Hotel de lujo');
INSERT INTO CategoriaHotel (categoria) VALUES ('Hotel de negocios');
INSERT INTO CategoriaHotel (categoria) VALUES ('Hotel resort');
INSERT INTO CategoriaHotel (categoria) VALUES ('Hotel Familiar');
INSERT INTO CategoriaHotel (categoria) VALUES ('Alojamiento');

select * from CategoriaHotel

INSERT INTO Hotel (hotel, puntuacion, Ciudad_idCiudad, CategoriaHotel_idCatHot)
VALUES 
    ('Hotel Plaza', 4, 1, 1),  -- Categoría: Hotel - Ciudad: La Paz
    ('Hostal del Lago', 3, 2, 2),  -- Categoría: Hostal - Ciudad: Santa Cruz de la Sierra
    ('Hotel Camino Real', 5, 3, 3),  -- Categoría: Hotel de lujo - Ciudad: Cochabamba
    ('Hotel Los Tajibos', 4, 4, 4),  -- Categoría: Hotel de negocios - Ciudad: Sucre
    ('Hotel Rosario', 4, 5, 5),  -- Categoría: Hotel resort - Ciudad: Oruro
    ('Hotel Las Palmas', 3, 6, 6),  -- Categoría: Hotel Familiar - Ciudad: Potosí
    ('Alojamiento Samay', 5, 7, 7),  -- Categoría: Alojamiento - Ciudad: Tarija
    ('Hotel La Siesta', 4, 8, 1),  -- Categoría: Hotel - Ciudad: Beni
    ('Hostal Maya', 3, 9, 2),  -- Categoría: Hostal - Ciudad: Pando
    ('Hotel Alcala', 5, 1, 3),  -- Categoría: Hotel de lujo - Ciudad: La Paz
    ('Hotel Regina', 4, 2, 4),  -- Categoría: Hotel de negocios - Ciudad: Santa Cruz de la Sierra
    ('Hotel Colonial', 4, 4, 5),  -- Categoría: Hotel resort - Ciudad: Cochabamba
    ('Hostal San Francisco', 3, 4, 6),  -- Categoría: Hotel Familiar - Ciudad: Sucre
    ('Hotel Europa', 5, 5, 7),  -- Categoría: Alojamiento - Ciudad: Oruro
    ('Hotel Real', 4, 6, 1);  -- Categoría: Hotel - Ciudad: Potosí
	
select * from Hotel;

INSERT INTO Aerolinea (aerolinea)
VALUES 
    ('Boliviana de Aviacion'),
	('Amaszonas'),
	('Latam'),
	('Iberia'),
	('Avianca'),
	('Volaris');
	
select * from aerolinea;


INSERT INTO CategoriaAtraccion (categoria) 
VALUES 
    ('Parque Nacional'),
    ('Sitio Arqueológico'),
    ('Mirador'),
    ('Cascada'),
    ('Mercado artesanal');
	

INSERT INTO Atraccion (atraccion, CategoriaAtraccion_idCatAtrac, Ciudad_idCiudad, precio, detalle)
VALUES 
    ('Cataratas del Yguazú', 4, 1, 25.00,''),  -- Ciudad: La Paz, Categoría: Cascada
    ('Ruinas de Tiwanaku', 2, 1, 10.00,''),  -- Ciudad: La Paz, Categoría: Sitio Arqueológico
    ('Cristo de la Concordia', 3, 3, 5.00,''),  -- Ciudad: Cochabamba, Categoría: Mirador
    ('Salar de Uyuni', 1, 6, 30.00,''),  -- Ciudad: Potosí, Categoría: Parque Nacional
    ('Fortaleza de Samaipata', 2, 2, 15.00,''),  -- Ciudad: Santa Cruz de la Sierra, Categoría: Sitio Arqueológico
    ('Mercado de las Brujas', 5, 1, 5.00,''),  -- Ciudad: La Paz, Categoría: Mercado artesanal
    ('Catarata de Arco Iris', 4, 7, 20.00,'');  -- Ciudad: Tarija, Categoría: Cascada

select * from atraccion;

-- Eliminar todos los datos de la tabla Categoria Actividades
DELETE FROM CategoriaActividad;

-- Reiniciar la secuencia asociada a la columna idCiudad
ALTER SEQUENCE categoriaactividad_idcatacti_seq RESTART WITH 1;

-- Insertar categorías de actividad
INSERT INTO CategoriaActividad (categoria) VALUES 
    ('Trekking'),
    ('Visita a museos'),
    ('Avistamiento de aves'),
    ('Ciclismo de montaña'),
    ('Tour gastronómico'),
    ('Conciertos');

-- Insertar actividades
INSERT INTO Actividad (actividad, Ciudad_idCiudad, CategoriaActividad_idCatActi, fecha, precio, detalle)
VALUES 
    ('Ascenso al Huayna Potosí', 1, 1, '2024-05-10', 40.00, 'Horario: 12:00pm'),  -- Ciudad: La Paz
    ('Visita al Museo de la Coca', 1, 2, '2024-05-23', 15.00, 'Horario: 12:00pm'),  -- Ciudad: La Paz
    ('Avistamiento de aves en el Jardín Botánico', 3, 3, '2024-06-07', 5.00, 'Horario: 12:00pm'),  -- Ciudad: Cochabamba
    ('Ciclismo de montaña en la Ruta de las Yungas', 1, 4, '2024-06-21', 20.00, 'Horario: 12:00pm'),  -- Ciudad: La Paz
    ('Tour gastronómico por la calle Jaén', 1, 5, '2024-05-02', 10.00, 'Horario: 12:00pm'),  -- Ciudad: La Paz
    ('Concierto en el Estadio Hernando Siles', 1, 6, '2024-04-28', 30.00, 'Horario: 12:00pm'),  -- Ciudad: La Paz
    ('Recital en el Teatro Municipal de Santa Cruz', 2, 6, '2024-06-17', 25.00, 'Horario: 12:00pm');  -- Ciudad: Santa Cruz de la Sierra

select * from Actividad;

INSERT INTO Auto (modelo, marca, tipo)
VALUES 
    ('Civic', 'Honda', 'Sedán'),
    ('Corolla', 'Toyota', 'Sedán'),
    ('Accord', 'Honda', 'Sedán'),
    ('Camry', 'Toyota', 'Sedán'),
    ('Mustang', 'Ford', 'Deportivo'),
    ('Camaro', 'Chevrolet', 'Deportivo'),
    ('F-150', 'Ford', 'Camioneta'),
    ('Ranger', 'Ford', 'Camioneta'),
    ('Wrangler', 'Jeep', 'SUV'),
    ('RAV4', 'Toyota', 'SUV'),
    ('CR-V', 'Honda', 'SUV');

select * from auto;

INSERT INTO Seguro (seguro, cobertura, precio)
VALUES 
    ('Seguro Básico', 'Atención médica básica', 50.00),
    ('Seguro Estándar', 'Atención médica y repatriación', 75.00),
    ('Seguro Premium', 'Atención médica y pérdida de equipaje', 100.00),
    ('Seguro de Viaje Aventura', 'Atención médica especializada', 120.00),
    ('Seguro Familiar', 'Cobertura para toda la familia', 150.00);
	
	
INSERT INTO FormaPago (formapago)
VALUES 
    ('Efectivo'),
    ('Tarjeta de crédito'),
    ('Tarjeta de débito'),
    ('Transferencia bancaria'),
    ('Pago en línea');	
	
	