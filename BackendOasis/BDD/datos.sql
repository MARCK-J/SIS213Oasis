
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

    INSERT INTO Hotel (hotel, puntuacion, Ciudad_idCiudad, CategoriaHotel_idCatHot, totalHabitaciones, descripcion, imagenes, ubicacion)
VALUES
    ('Hotel Plaza', 4, 1, 1, 120, 'Un lugar acogedor en el centro de la ciudad.', 'https://example.com/hotel_plaza.jpg', 'Calle Principal 123, La Paz'),
    ('Hostal del Lago', 3, 2, 2, 150, 'Ideal para mochileros y viajeros de presupuesto ajustado.', 'https://example.com/hostal_del_lago.jpg', 'Avenida Lago 456, Santa Cruz de la Sierra'),
    ('Hotel Camino Real', 5, 3, 3, 160, 'Lujo y confort en el corazón de la ciudad.', 'https://example.com/hotel_camino_real.jpg', 'Calle Real 789, Cochabamba'),
    ('Hotel Los Tajibos', 4, 4, 4, 100, 'El mejor hotel de negocios con todas las comodidades.', 'https://example.com/hotel_los_tajibos.jpg', 'Avenida Empresarial 101, Sucre'),
    ('Hotel Rosario', 4, 5, 5, 95, 'Resort con vistas espectaculares y servicios exclusivos.', 'https://example.com/hotel_rosario.jpg', 'Calle Vista Hermosa 202, Oruro'),
    ('Hotel Las Palmas', 3, 6, 6, 140, 'Ambiente familiar y acogedor para toda la familia.', 'https://example.com/hotel_las_palmas.jpg', 'Avenida Familiar 303, Potosí'),
    ('Alojamiento Samay', 5, 7, 7, 130, 'Alojamiento tranquilo y confortable para una estadía perfecta.', 'https://example.com/alojamiento_samay.jpg', 'Calle Tranquila 404, Tarija'),
    ('Hotel La Siesta', 4, 8, 1, 160, 'Un hotel perfecto para descansar y relajarse.', 'https://example.com/hotel_la_siesta.jpg', 'Avenida Relax 505, Beni'),
    ('Hostal Maya', 3, 9, 2, 180, 'Hostal económico con excelente servicio.', 'https://example.com/hostal_maya.jpg', 'Calle Económica 606, Pando'),
    ('Hotel Alcala', 5, 1, 3, 160, 'Lujo y elegancia en cada rincón del hotel.', 'https://example.com/hotel_alcala.jpg', 'Calle Lujosa 707, La Paz'),
    ('Hotel Regina', 4, 2, 4, 200, 'Hotel de negocios con todas las facilidades modernas.', 'https://example.com/hotel_regina.jpg', 'Avenida Modernidad 808, Santa Cruz de la Sierra'),
    ('Hotel Colonial', 4, 4, 5, 165, 'Resort con estilo colonial y servicios de alta calidad.', 'https://example.com/hotel_colonial.jpg', 'Calle Colonial 909, Cochabamba'),
    ('Hostal San Francisco', 3, 4, 6, 170, 'Hostal familiar con ambiente acogedor y seguro.', 'https://example.com/hostal_san_francisco.jpg', 'Avenida Familiar 1010, Sucre'),
    ('Hotel Europa', 5, 5, 7, 210, 'Alojamiento europeo con todos los servicios necesarios.', 'https://example.com/hotel_europa.jpg', 'Calle Europea 1111, Oruro'),
    ('Hotel Real', 4, 6, 1, 130, 'Hotel céntrico con todas las comodidades.', 'https://example.com/hotel_real.jpg', 'Avenida Central 1212, Potosí');


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
	
INSERT INTO Hotel (hotel, puntuacion, Ciudad_idCiudad, CategoriaHotel_idCatHot, totalHabitaciones, descripcion, imagenes, ubicacion) VALUES
('Sumerville All Inclusive Resort', 3, 1, 1, 200, 'Un resort todo incluido en un entorno paradisiaco.', 'sumerville.jpg', 'Sumerville, Brasil'),
('Salinas Margogi All Inclusive Resort', 4, 2, 2, 150, 'Un resort todo incluido con vistas espectaculares.', 'salinas.jpg', 'Salinas, Brasil'),
('Japaratinga Lounge Resort', 5, 3, 3, 120, 'Resort con ambiente lounge en la playa.', 'japaratinga.jpg', 'Japaratinga, Brasil'),
('Fairmont Rio de Janeiro Copacabana', 5, 4, 4, 400, 'Hotel de lujo frente a la playa de Copacabana.', 'fairmont.jpg', 'Río de Janeiro, Brasil'),
('Four Seasons Buenos Aires', 4, 5, 5, 250, 'Hotel de lujo en el corazón de Buenos Aires.', 'fourseasons_ba.jpg', 'Buenos Aires, Argentina'),
('Elcielo Colombia', 3, 6, 6, 100, 'Experiencia celestial en Colombia.', 'elcielo.jpg', 'Colombia'),
('Emiliano Rio de Janeiro Brasil', 4, 7, 7, 80, 'Hotel boutique en Río de Janeiro.', 'emiliano.jpg', 'Río de Janeiro, Brasil'),
('Hotel Eurobuilding Caracas Venezuela', 4, 8, 8, 300, 'Hotel de negocios en Caracas.', 'eurobuilding.jpg', 'Caracas, Venezuela'),
('Hotel Fasano Belo Horizonte Brasil', 5, 9, 9, 140, 'Elegante hotel en Belo Horizonte.', 'fasano.jpg', 'Belo Horizonte, Brasil'),
('Hyatt Centric San Isidro Lima Peru', 4, 10, 10, 160, 'Hotel moderno en el distrito de San Isidro.', 'hyatt_centric.jpg', 'Lima, Perú'),
('Intercontinental Real Santo Domingo Republica', 5, 11, 11, 220, 'Hotel de lujo en Santo Domingo.', 'intercontinental_real.jpg', 'Santo Domingo, República Dominicana'),
('Live Aqua Urban Resort Monterrey, Mexico', 4, 12, 12, 180, 'Resort urbano en Monterrey.', 'live_aqua.jpg', 'Monterrey, México'),
('Los Tajibos, a Tribute Portfolio Hotel Santa Cruz, Bolivia', 3, 13, 13, 200, 'Hotel en Santa Cruz con excelente servicio.', 'los_tajibos.jpg', 'Santa Cruz, Bolivia'),
('Mandarin Oriental de Santiago Santiago de Chile', 5, 14, 14, 250, 'Hotel de lujo en Santiago de Chile.', 'mandarin_oriental.jpg', 'Santiago de Chile, Chile'),
('W Bogota Colombia', 4, 15, 15, 150, 'Hotel moderno en Bogotá.', 'w_bogota.jpg', 'Bogotá, Colombia'),
('Hilton Guadalajara Midtown Mexico', 3, 16, 16, 200, 'Hotel Hilton en el corazón de Guadalajara.', 'hilton_midtown.jpg', 'Guadalajara, México'),
('Alvear Palace Hotel Buenos Aires Argentina', 5, 17, 17, 250, 'Palacio convertido en hotel de lujo.', 'alvear_palace.jpg', 'Buenos Aires, Argentina'),
('Baruk Hotel de Autor Guadalajara', 4, 18, 18, 100, 'Hotel boutique de autor en Guadalajara.', 'baruk.jpg', 'Guadalajara, México'),
('Four Seasons México City Ciudad de México', 5, 19, 19, 300, 'Hotel de lujo en Ciudad de México.', 'fourseasons_mex.jpg', 'Ciudad de México, México'),
('Gran Hotel Costa Rica, Curio Collection by Hilton San Jose Puerto Rico', 4, 20, 20, 150, 'Hotel histórico en San José.', 'gran_hotel_costa_rica.jpg', 'San José, Puerto Rico'),
('Grand Hyatt Sao Paulo Brasil', 5, 21, 21, 250, 'Gran hotel en el distrito financiero de Sao Paulo.', 'grand_hyatt_sp.jpg', 'Sao Paulo, Brasil'),
('Habita Monterrey', 3, 22, 22, 100, 'Hotel moderno en Monterrey.', 'habita.jpg', 'Monterrey, México'),
('Hotel Hilton Colón Guayaquil', 4, 23, 23, 200, 'Hotel de negocios en Guayaquil.', 'hilton_colon.jpg', 'Guayaquil, Ecuador'),
('Hotel Real Intercontinental Guatemala', 5, 24, 24, 180, 'Hotel de lujo en Ciudad de Guatemala.', 'intercontinental_gt.jpg', 'Ciudad de Guatemala, Guatemala'),
('Hotel Unique Sao Paulo', 4, 25, 25, 95, 'Hotel con arquitectura única en Sao Paulo.', 'unique.jpg', 'Sao Paulo, Brasil'),
('Hyatt Place San Pedro Sula Honduras', 3, 26, 26, 150, 'Hotel moderno en San Pedro Sula.', 'hyatt_place.jpg', 'San Pedro Sula, Honduras'),
('JW Marriott Hotel Santo Domingo República Dominicana', 5, 27, 27, 200, 'Hotel de lujo en Santo Domingo.', 'jw_marriott.jpg', 'Santo Domingo, República Dominicana'),
('Live Aqua Urban Resort Monterrey', 4, 12, 12, 180, 'Resort urbano en Monterrey.', 'live_aqua.jpg', 'Monterrey, México'),
('Palacio Duhau - Park Hyatt Buenos Aires', 5, 28, 28, 150, 'Palacio convertido en hotel de lujo.', 'palacio_duhau.jpg', 'Buenos Aires, Argentina'),
('Rosewood Sao Paulo', 4, 29, 29, 120, 'Hotel de lujo en el centro de Sao Paulo.', 'rosewood.jpg', 'Sao Paulo, Brasil'),
('Sheraton Puerto Rico Hotel & Casino Puerto Rico', 4, 30, 30, 220, 'Hotel y casino en Puerto Rico.', 'sheraton.jpg', 'Puerto Rico'),
('Sofitel Bogotá Victoria Regia', 4, 15, 15, 100, 'Hotel de lujo en Bogotá.', 'sofitel_bogota.jpg', 'Bogotá, Colombia'),
('Sofitel Mexico City Reforma Ciudad de México', 5, 31, 31, 200, 'Hotel Sofitel en la Ciudad de México.', 'sofitel_mexico.jpg', 'Ciudad de México, México'),
('Sofitel Montevideo Casino Carrasco & Spa', 4, 32, 32, 140, 'Hotel y casino en Montevideo.', 'sofitel_montevideo.jpg', 'Montevideo, Uruguay'),
('The Ritz-Carlton Mexico City', 5, 19, 19, 220, 'Hotel de lujo en la Ciudad de México.', 'ritz_mexico.jpg', 'Ciudad de México, México'),
('The Ritz-Carlton Santiago, Santiago de Chile', 5, 14, 14, 200, 'Hotel de lujo en Santiago de Chile.', 'ritz_santiago.jpg', 'Santiago de Chile, Chile');

INSERT INTO Aerolinea (aerolinea) VALUES
('Boliviana de Aviación'),
('AmasZonas'),
('Ecojet'),
('AirFrance KLM'),
('Star Peru'),
('GOL Linhas Aéreas Inteligentes');

INSERT INTO Auto (modelo, marca, tipo) VALUES
('Qashqai', 'Nissan', 'SUV'),
('Kicks', 'Nissan', 'SUV'),
('Frontier', 'Nissan', 'Camioneta (Pickup)'),
('X-Trail', 'Nissan', 'SUV'),
('Versa', 'Nissan', 'Sedán'),
('March', 'Nissan', 'Hatchback'),
('Pathfinder', 'Nissan', 'SUV'),
('Navara', 'Nissan', 'Camioneta (Pickup)'),
('Murano', 'Nissan', 'SUV'),
('Sentra', 'Nissan', 'Sedán'),
('Altima', 'Nissan', 'Sedán'),
('Maxima', 'Nissan', 'Sedán'),

('EcoSport', 'Ford', 'SUV'),
('Ranger', 'Ford', 'Camioneta (Pickup)'),
('Explorer', 'Ford', 'SUV'),
('Escape', 'Ford', 'SUV'),
('Mustang', 'Ford', 'Coupé'),
('F-150', 'Ford', 'Camioneta (Pickup)'),
('Focus', 'Ford', 'Sedán'),
('Edge', 'Ford', 'SUV'),
('Territory', 'Ford', 'SUV'),
('Kuga', 'Ford', 'SUV'),
('Mondeo', 'Ford', 'Sedán'),
('Fiesta', 'Ford', 'Hatchback'),

('Hilux', 'Toyota', 'Camioneta (Pickup)'),
('Corolla', 'Toyota', 'Sedán'),
('RAV4', 'Toyota', 'SUV'),
('Fortuner', 'Toyota', 'SUV'),
('Land Cruiser', 'Toyota', 'SUV'),
('Yaris', 'Toyota', 'Hatchback'),
('Prado', 'Toyota', 'SUV'),
('Avanza', 'Toyota', 'Minivan'),
('Tacoma', 'Toyota', 'Camioneta (Pickup)'),
('SWA', 'Toyota', 'SUV'),
('Etios', 'Toyota', 'Sedán'),
('Camry', 'Toyota', 'Sedán'),
('Land Cruiser Prado', 'Toyota', 'SUV'),

('Tracker', 'Chevrolet', 'SUV'),
('Spark', 'Chevrolet', 'Hatchback'),
('Onix', 'Chevrolet', 'Hatchback/Sedán'),
('Sail', 'Chevrolet', 'Sedán'),
('Colorado', 'Chevrolet', 'Camioneta (Pickup)'),
('Equinox', 'Chevrolet', 'SUV'),
('Captiva', 'Chevrolet', 'SUV'),
('Tahoe', 'Chevrolet', 'SUV'),
('Cruze', 'Chevrolet', 'Sedán'),
('Aveo', 'Chevrolet', 'Sedán'),
('Cavalier', 'Chevrolet', 'Sedán'),
('Trax', 'Chevrolet', 'SUV'),
('S10', 'Chevrolet', 'Camioneta (Pickup)'),

('Gol', 'Volkswagen', 'Hatchback'),
('T-Cross', 'Volkswagen', 'SUV'),
('Nivus', 'Volkswagen', 'SUV'),
('Virtus', 'Volkswagen', 'Sedán'),
('Saveiro', 'Volkswagen', 'Camioneta (Pickup)'),
('Amarok', 'Volkswagen', 'Camioneta (Pickup)'),
('Jetta', 'Volkswagen', 'Sedán'),
('Tiguan', 'Volkswagen', 'SUV'),
('Polo', 'Volkswagen', 'Hatchback'),
('Teramont', 'Volkswagen', 'SUV'),
('Vento', 'Volkswagen', 'Sedán'),
('Golf', 'Volkswagen', 'Hatchback'),
('Passat', 'Volkswagen', 'Sedán'),

('Strada', 'Fiat', 'Camioneta (Pickup)'),
('Toro', 'Fiat', 'Camioneta (Pickup)'),
('Argo', 'Fiat', 'Hatchback'),
('Cronos', 'Fiat', 'Sedán'),
('Mobi', 'Fiat', 'Hatchback'),
('Uno', 'Fiat', 'Hatchback'),
('Fiorino', 'Fiat', 'Furgoneta'),
('Pulse', 'Fiat', 'SUV'),
('Doblo', 'Fiat', 'Minivan'),

('Duster', 'Renault', 'SUV'),
('Logan', 'Renault', 'Sedán'),
('Sandero', 'Renault', 'Hatchback'),
('Stepway', 'Renault', 'Crossover'),
('Captur', 'Renault', 'SUV'),
('Alaskan', 'Renault', 'Camioneta (Pickup)'),
('Koleos', 'Renault', 'SUV'),
('Kwid', 'Renault', 'Hatchback'),
('Kangoo', 'Renault', 'Furgoneta'),

('Creta', 'Hyundai', 'SUV'),
('HB20', 'Hyundai', 'Hatchback'),
('Tucson', 'Hyundai', 'SUV'),
('Santa Fe', 'Hyundai', 'SUV'),
('Elantra', 'Hyundai', 'Sedán'),
('Sonata', 'Hyundai', 'Sedán'),
('Accent', 'Hyundai', 'Sedán'),
('i30', 'Hyundai', 'Hatchback'),
('Venue', 'Hyundai', 'SUV'),
('Kona', 'Hyundai', 'SUV'),

('Sportage', 'Kia', 'SUV'),
('Rio', 'Kia', 'Hatchback'),
('Forte', 'Kia', 'Sedán'),
('Seltos', 'Kia', 'SUV'),
('Sorento', 'Kia', 'SUV'),
('Soul', 'Kia', 'Hatchback'),
('Optima', 'Kia', 'Sedán'),
('Stinger', 'Kia', 'Sedán'),
('Telluride', 'Kia', 'SUV'),

('CX-5', 'Mazda', 'SUV'),
('Mazda 3', 'Mazda', 'Sedán'),
('Mazda 2', 'Mazda', 'Hatchback'),
('BT-50', 'Mazda', 'Camioneta (Pickup)'),
('CX-9', 'Mazda', 'SUV'),
('Mazda 6', 'Mazda', 'Sedán'),
('MX-5', 'Mazda', 'Roadster'),
('CX-3', 'Mazda', 'SUV');


	