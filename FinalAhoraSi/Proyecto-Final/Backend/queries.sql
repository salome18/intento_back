CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    correo TEXT,
    password TEXT
);

INSERT INTO usuarios (nombre, correo, password) 
VALUES
('Carolina', 'carolina@gmail.com', '12234C'),
('Salome', 'salome@gamil.com', '1234'),
('Cristian', 'cristian@gmail.com', '123456');


CREATE TABLE cars (
    nombre VARCHAR(255),
    marca VARCHAR(100),
    combustible VARCHAR(50),
    transmision VARCHAR(50),
    carroceria VARCHAR(50),
    modelo INT,
    precio_por_dia INT,
    imagen VARCHAR(255)
);


INSERT INTO cars (nombre, marca, combustible, transmision, carroceria, modelo, precio_por_dia, imagen) VALUES
('Clase A 250e Progressive Line Advanced 8G-DCT', 'Mercedes-Benz', 'Híbrido', 'Automática', 'Sedán', 2020, 450000, 'https://imgur.com/qjQaMWw'),
('Clase GLA 45 S AMG 4Matic 8G-DCT', 'Mercedes-Benz', 'Gasolina', 'Automática', 'SUV', 2016, 600000, 'https://imgur.com/XIteVWS'),
('Clase GLB 200 7G-DCT', 'Mercedes-Benz', 'Gasolina', 'Automática', 'SUV', 2021, 500000, 'https://imgur.com/0VAppyk'),
('MERCEDES-BENZ EQB 350 4Matic', 'Mercedes-Benz', 'Eléctrico', 'Automática', 'SUV', 2022, 700000, 'https://imgur.com/wohy7nG'),
('EQE AMG 53 4Matic Edition', 'Mercedes-Benz', 'Eléctrico', 'Automática', 'Sedán', 2019, 800000, 'https://imgur.com/uBxCVLT'),
('BMW X7 2024', 'BMW', 'Híbrido', 'Automática', 'SUV', 2024, 900000, 'https://imgur.com/aVa75L5'),
('BMW X6 2024', 'BMW', 'Híbrido', 'Automática', 'SUV', 2024, 850000, 'https://imgur.com/xgjfWKA'),
('BMW X3 2024', 'BMW', 'Eléctrico', 'Automática', 'SUV', 2024, 750000, 'https://imgur.com/3oH2CNO'),
('BMW i5 2024', 'BMW', 'Eléctrico', 'Automática', 'Sedán', 2024, 800000, 'https://imgur.com/azHTAUF'),
('BMW M440i Convertible', 'BMW', 'Gasolina', 'Automática', 'Sedán', 2022, 700000, 'https://imgur.com/2lrv0ui'),
('Mazda Sedan 2', 'Mazda', 'Gasolina', 'Manual', 'Sedán', 2012, 150000, 'https://imgur.com/WEnXo8H'),
('Mazda CX-90 Híbrida', 'Mazda', 'Híbrido', 'Automática', 'SUV', 2024, 700000, 'https://imgur.com/btW9JKT'),
('Mazda MX-30 Eléctrico', 'Mazda', 'Eléctrico', 'Automática', 'SUV', 2024, 650000, 'https://imgur.com/jtq1ZgQ'),
('Mazda 3 2.0 Touring', 'Mazda', 'Gasolina', 'Manual', 'Sedán', 2017, 200000, 'https://imgur.com/lK7qiEs'),
('Mazda CX-30 Touring Mecánica', 'Mazda', 'Gasolina', 'Manual', 'SUV', 2019, 250000, 'https://imgur.com/p974qFb'),
('Nissan Qashqai 2.0 Sense 140 hp', 'Nissan', 'Gasolina', 'Manual', 'SUV', 2024, 350000, 'https://imgur.com/Z5twmpx'),
('Nissan Versa 1.6 Exclusive', 'Nissan', 'Gasolina', 'Automática', 'Sedán', 2022, 250000, 'https://imgur.com/N0rboR5'),
('Nissan Patrol', 'Nissan', 'Gasolina', 'Automática', 'SUV', 2019, 400000, 'https://imgur.com/Usn0uCB'),
('Nissan Tiida 1.8 Miio', 'Nissan', 'Gasolina', 'Manual', 'Sedán', 2013, 150000, 'https://imgur.com/wToUhYS'),
('Nissan Murano Exclusive', 'Nissan', 'Gasolina', 'Automática', 'SUV', 2018, 350000, 'https://imgur.com/mw4uzLz'),
('Audi Q5 45 TFSI MHEV quattro S line', 'Audi', 'Híbrido', 'Automática', 'SUV', 2024, 700000, 'https://imgur.com/OtBIcpP'),
('Audi A4 40 TFSI Prestige Black', 'Audi', 'Gasolina', 'Automática', 'Sedán', 2014, 250000, 'https://imgur.com/8hKvlVD'),
('Audi Q5 TFSI quattro Advanced Híbrido', 'Audi', 'Híbrido', 'Automática', 'SUV', 2021, 650000, 'https://imgur.com/HJrOK2Q'),
('Audi E-tron Advanced', 'Audi', 'Eléctrico', 'Automática', 'SUV', 2022, 800000, 'https://imgur.com/0RQRnkS'),
('Audi A3 1.2 Turbo', 'Audi', 'Gasolina', 'Manual', 'Sedán', 2015, 200000, 'https://imgur.com/0guCOyE');


CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    precio_total DECIMAL(10, 2)
);
