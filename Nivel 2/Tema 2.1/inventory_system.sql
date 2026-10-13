-- Creación de Tablas --

CREATE TABLE proveedores(
    id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre_provedor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE componentes (
    id_componente INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre_componente VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    sub_categoria VARCHAR(50),
    id_proveedor INT NOT NULL,
    material_componente VARCHAR(50) NOT NULL,
    cantidad_componente INT CHECK (cantidad_componente > 0),
    valor_componente DECIMAL(10, 2) CHECK (valor_componente > 0),
    PRIMARY KEY (id_componente),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE movimientos_inventario(
    id_movimiento INT NOT NULL UNIQUE AUTO_INCREMENT,
    tipo_movimiento VARCHAR(50) NOT NULL CHECK (tipo_movimiento IN ('Venta', 'Envio', 'Eliminado')),
    id_componente INT NOT NULL,
    cantidad_componente INT NOT NULL,
    motivo_movimiento VARCHAR(250),
    PRIMARY KEY (id_movimiento),
    FOREIGN KEY (id_componente) REFERENCES componentes(id_componente)
);

-- Creación de INDEX -- 

CREATE INDEX idx_componentes
ON componentes (id_componente, nombre_componente, categoria, sub_categoria, cantidad_componente, valor_componente);

-- Poblamiento de Datos --
    -- Proveedores --

INSERT INTO proveedores (nombre_provedor) VALUES
('bot-om'),
('bitilio'),
('roparts S.A.S'),
('3debiots & Asociados'),
('shaggy.online factory');

    -- Componentes --

INSERT INTO componentes (nombre_componente, categoria, sub_categoria, id_proveedor, material_componente, cantidad_componente, valor_componente) VALUES
('Arduino UNO R3', 'Unidad de Procesamiento y Control', 'Placa Microcontroladora', 01, 'Placa de circuito impreso (FR4)', 65, 65000),
('Raspberry Pi 4 Model B', 'Unidad de Procesamiento y Control', 'Microordenador', 02, 'Placa de circuito impreso (FR4)', 38, 380000),
('Servo Shield', 'Unidad de Procesamiento y Control', 'Placa de Expansión / Shield de Control', 03, 'Placa de circuito impreso (FR4)', 25, 25000),
('TowerPro SG90', 'Sistemas de Actuación y Movimiento', 'Servomotor de Posicionamiento', 04, 'ABS', 90, 9000),
('MG995', 'Sistemas de Actuación y Movimiento', 'Servomotor de Alto Torque', 05, 'ABS', 35, 35000),
('Tipo TT', 'Sistemas de Actuación y Movimiento', 'Motorreductor DC', 04, 'ABS', 60, 6000),
('NEMA 17', 'Sistemas de Actuación y Movimiento', 'Motor Paso a Paso', 03, 'Aleación de acero magnético', 45, 45000),
('L298N', 'Sistemas de Actuación y Movimiento', 'Driver / Puente H para Motores', 02, 'Placa de circuito impreso (FR4)', 12, 12000),
('HC-SR04', 'Sistemas de Percepción y Sensores', 'Sensor Ultrasónico de Distancia', 01, 'Placa de circuito impreso (FR4)', 60, 6000),
('TCRT5000', 'Sistemas de Percepción y Sensores', 'Sensor Infrarrojo Seguidor de Línea', 02, 'Placa de circuito impreso (FR4)', 40, 4000),
('MPU6050', 'Sistemas de Percepción y Sensores', 'Módulo de Giroscopio y Acelerómetro', 03, 'Placa de circuito impreso (FR4)', 12, 12000),
('OV2640', 'Sistemas de Percepción y Sensores', 'Módulo de Cámara', 04, 'Vidrio, FPC', 30, 30000),
('DHT22', 'Sistemas de Percepción y Sensores', 'Sensor de Temperatura y Humedad', 05, 'ABS', 80, 8000),
('Switch Pulsador', 'Sistemas de Percepción y Sensores', 'Sensor de Táctil / Final de Carrera', 04, 'PBT/Nylon', 15, 1500),
('7.4V 2S 1000mAh', 'Energía y Gestión de Potencia', 'Batería Recargable LiPo', 05, 'Polimero de Litio', 35, 35000),
('2x 18650', 'Energía y Gestión de Potencia', 'Portapilas / Contenedor para Pilas', 04, 'PP', 40, 4000),
('LM2596 Step-Down', 'Energía y Gestión de Potencia', 'Módulo Regulador de Voltaje DC-DC', 03, 'Placa de circuito impreso (FR4)', 80, 8000),
('TP4056', 'Energía y Gestión de Potencia', 'Módulo de Carga y Protección de Baterías', 02, 'Placa de circuito impreso (FR4)', 30, 3000),
('Kit 2WD/4WD', 'Estructura, Chasis y Transmisión Mecánica', 'Chasis de Acrílico u Aluminio para Carro Robot', 01, 'PMMA', 35, 35000),
('Ruedas con Neumático de Goma', 'Estructura, Chasis y Transmisión Mecánica', NULL, 02, 'ABS/Nylon', 40, 4000),
('Rodachín esférico', 'Estructura, Chasis y Transmisión Mecánica', 'Rueda Loca / Caster', 03, 'Acero galvanizado', 40, 4000),
('Standoffs', 'Estructura, Chasis y Transmisión Mecánica', 'Set de Tornillería, Tuercas y Espaciadores M3', 04, 'Acero inoxidable', 15, 15000),
('HC-06', 'Conectividad y Comunicación', 'Módulo Transceptor Bluetooth', 05, 'Placa de circuito impreso (FR4)', 15, 15000),
('NodeMCU Wi-Fi', 'Conectividad y Comunicación', 'Módulo de Comunicación Inalámbrica', 04, 'Placa de circuito impreso (FR4)', 20, 20000),
('16x2', 'Interfaz y Elementos de Interacción', 'Pantalla LCD I2C', 03, 'LCD y Placa de circuito impreso (FR4)', 18, 18000);

    -- Movimientos Inventarios -- 

INSERT INTO movimientos_inventario (tipo_movimiento, id_componente, cantidad_componente, motivo_movimiento) VALUES
('Venta', 01, 10, 'Empresa Solanimel S.A.S'),
('Envio', 25, 9, 'Reemplazo piezas con oxido, sede Japón'),
('Eliminado', 02, 8, 'Defecto de fabrica'),
('Venta', 24, 7, 'Equipo Semillero Ingeniería Mecatrónica, Universidad UniMinuto'),
('Envio', 03, 6, 'Reposición de productos, sede Alemania'),
('Eliminado', 23, 5, 'Piezas fracturadas'),
('Venta', 04, 4, 'Persona Natural'),
('Envio', 22, 3, 'Ensamblaje planta de producción, Industrias Ecopotrol'),
('Eliminado', 05, 2, 'Daño por caida'),
('Venta', 21, 1, 'Boston Dynamics'),
('Envio', 06, 2, 'Construcción Robots de seguridad, Casa Blanca (EE.UU)'),
('Eliminado', 20, 3, 'Actualización de componentes'),
('Envio', 07, 4, 'Construcción prototipo automatización agronoma, Ministerio de Agricultura (Colombia)'),
('Eliminado', 19, 5, 'Robo'),
('Envio', 08, 6, 'Construcción impresora 3D Industrial, 3dMarkets Industry'),
('Venta', 18, 7, 'Lenovo'),
('Eliminado', 09, 8, 'Retención en Aduanas'),
('Envio', 17, 9, 'Solicitud especial, sede Canadá'),
('Venta', 10, 10, 'Persona Natural'),
('Eliminado', 16, 9, 'Donados a fundación Mecatrónica sin Fronteras'),
('Envio', 11, 8, 'Equipo Semillero Ingeniería Mecatrónica, Universidad UniMinuto'),
('Venta', 15, 7, 'Toyota Japón'),
('Eliminado', 12, 6, 'Robo'),
('Envio', 14, 5, 'Reposición de productos, sede Japón'),
('Venta', 13, 4, 'Shusho Kantei');

-- Consultas --

SELECT
    mi.tipo_movimiento,
    mi.id_componente,
    c.nombre_componente,
    mi.motivo_movimiento,
    COUNT(mi.cantidad_componente) AS total_componentes
FROM movimientos_inventario mi
INNER JOIN componentes c ON mi.id_componente = c.id_componente
WHERE mi.tipo_movimiento = 'Eliminado'
GROUP BY mi.tipo_movimiento,  mi.id_componente, c.nombre_componente, mi.motivo_movimiento
HAVING COUNT(mi.cantidad_componente) >= 3
ORDER BY total_componentes DESC
LIMIT 3;