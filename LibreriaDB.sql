CREATE DATABASE IF NOT EXISTS LibreriaDB;
USE LibreriaDB;

CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    editorial VARCHAR(150),
    anio YEAR,
    genero VARCHAR(100),
    precio DECIMAL(10,2),
    existencias INT
);
