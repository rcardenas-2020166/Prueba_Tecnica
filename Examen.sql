/*DB_Examen*/

CREATE TABLE Regiones(
	codigoRegion INT NOT NULL PRIMARY KEY,
	nombreRegion VARCHAR(20) NOT NULL,
);

CREATE TABLE Departamentos(
	codigoDepartamento INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	nombreDepartamento VARCHAR(20) NOT NULL,
	codigoRegion INT NOT NULL,
	CONSTRAINT FK_Departamentos_Regiones FOREIGN KEY (codigoRegion)
		REFERENCES Regiones (codigoRegion)
);

CREATE TABLE Oficinas(
	codigoOficina INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	direccionOficina VARCHAR(255) NOT NULL,
	codigoDepartamento INT NOT NULL,
	CONSTRAINT FK_Oficinas_Departamentos FOREIGN KEY (codigoDepartamento)
		REFERENCES Departamentos (codigoDepartamento)
);

CREATE TABLE Telefonos(
	codigoTelefono INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	numeroTelefono VARCHAR(15) NOT NULL,
	codigoOficina INT NOT NULL,
	CONSTRAINT FK_Telefonos_Oficinas FOREIGN KEY (codigoOficina)
		REFERENCES Oficinas (codigoOficina)
);

CREATE TABLE DepartamentosEmpresa(
	codigoDepartamentoEmpresa INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nombreDepartamentoEmpresa VARCHAR(100) NOT NULL,
	codigoOficina INT NOT NULL,
	CONSTRAINT FK_DepartamentosEmpresa_Oficinas FOREIGN KEY (codigoOficina)
		REFERENCES Oficinas (codigoOficina)
);

CREATE TABLE TipoEmpleado(
	codigoTipoEmpleado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nombreTipoEmpleado VARCHAR(50) NOT NULL,
	sueldoBase DECIMAL(10,2) NOT NULL,
	bonificacion DECIMAL(10,2) DEFAULT 250.00,
	bonificacionEmpresa DECIMAL(10,2),
)

CREATE TABLE Empleados(
	codigoEmpleado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nombreEmpleado VARCHAR(255) NOT NULL,
	fechaNacimiento DATETIME NOT NULL,
	edadEmpleado INT NOT NULL,
	telefonoEmpleado VARCHAR(15) NOT NULL,
	fechaContratacion DATETIME NOT NULL,
	codigoTipoEmpleado INT NOT NULL,
	codigoDepartamentoEmpresa INT NOT NULL,
	CONSTRAINT FK_Empleados_TipoEmpleado FOREIGN KEY (codigoTipoEmpleado)
		REFERENCES TipoEmpleado (codigoTipoEmpleado),
	CONSTRAINT FK_Empleados_DepartamentosEmpresa FOREIGN KEY (codigoDepartamentoEmpresa)
		REFERENCES DepartamentosEmpresa (codigoDepartamentoEmpresa)
);


/* ------------ INSERT ------------ */

-- --- Regiones ---

insert into Regiones (codigoRegion, nombreRegion)
	values(1, 'Metropolitana');
insert into Regiones (codigoRegion, nombreRegion)
	values(2, 'Norte');
insert into Regiones (codigoRegion, nombreRegion)
	values(3, 'Nor-Oriente');
insert into Regiones (codigoRegion, nombreRegion)
	values(4, 'Sur-Oriente');
insert into Regiones (codigoRegion, nombreRegion)
	values(5, 'Central');
insert into Regiones (codigoRegion, nombreRegion)
	values(6, 'Sur-Occidente');
insert into Regiones (codigoRegion, nombreRegion)
	values(7, 'Nor-Occidente');
insert into Regiones (codigoRegion, nombreRegion)
	values(8, 'Petén');
    

-- --- Departamentos ---

insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Guatemala', 1);
 insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Alta Verapaz', 2);   
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Baja Verapaz', 2);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Chiquimula', 3);
 insert into Departamentos (nombreDepartamento, codigoRegion)
	values('El Progreso', 3);   
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Izabal', 3);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Zacapa', 3);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Jutiapa', 4);   
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Jalapa', 4);  
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Santa Rosa', 4);   
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Chimaltenango', 5);   
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Sacatepéquez', 5); 
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Escuintla', 5); 
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Quetzaltenango', 6);  
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Retalhuleu', 6);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('San Marcos', 6);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Suchitepéquez', 6);  
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Sololá', 6);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Totonicapán', 6);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Huehuetenango', 7);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Quiché', 7);
insert into Departamentos (nombreDepartamento, codigoRegion)
	values('Petén', 8);


-- --- TipoEmpleado ---

insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Jefe Comercial', 18500.36, 800.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Vendedor', 2575.81, 600.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Supervisor de Marketing', 3225.00, 100.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Community Manager', 20800.00, 350.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Gerente Administrativo y Financiero', 35500.00, 500.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Analista de Créditos y Riesgos', 6000.00, 500.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Asistente de Impuestos', 5410.36, 225.98);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Gerente General', 9750.00, 270.00);    
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Asistente de Relaciones Públicas', 4500.00, 150.00);
    insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Recepcionista', 2750.00, 300.00);    
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Auditor', 37000.00, 500.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Gerente Informatico', 44000.00, 3000.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Programador Senior', 44000.00, 1000.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Técnico en Redes y Servidores', 8000.00, 500.00);    
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Desarrollador Web', 5000.00, 200.00);   
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Jefe de Producción Industrial', 10500.00, 200.00);   
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Técnico en Control de Calidad', 7000.00, 800.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Gerente de Recursos Humanos', 7850.00, 375.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Encargado de Desarrollo Organizacional', 6478.00, 375.00); 
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Encargado de Reclutamiento y/o Selección', 3750.00, 250.00);   
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Jefe de Logística', 36705.32, 250.00);      
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Encargado Comercio Exterior', 9300.00, 250.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Operador de Montacargas', 3500.00, 250.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Gerente de Servicios Generales', 5000.00, 500.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Secretaria', 2700.00, 400.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Chofer', 2700.00, 400.00);
insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacionEmpresa)
	values('Encargado de Limpieza', 2600.00, 400.00);


-- --- Oficinas ---

insert into Oficinas (direccionOficina, codigoDepartamento)
	values('8va. Calle zona 3 Edificio Multiservicios 2do. Nivel, Santa Cruz del Quiché', 21);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('2da. Calle “B” 3-06 Zona 1,Estanzuela, Zacapa', 7);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('5ta. Av. 10-04 San Benito Y Galerias Karossi Local 4 Santa Elena, Peten', 22);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Avenida La Parroquia Zona 1 Calle 3 de Mayo, Santa Cruz Verapaz, A.V.', 2);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('0 Av. 2-29 zona 1 El Progreso, Jutiapa', 8);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('3ra. Calle 1-39B zona 4, Ciudad Vieja, Sacatepéquez', 12);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('4ta. Avenida, entre 3ra. y 2da. calle, zona 1, San Bernardino, Suchitepéquez', 17);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Barrio El Tamarindo San Sebastian Z.0, El Progreso', 5);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Av 7-61 Zona 1 Santa Lucia Cotzumalguapa, Escuintla', 13);    
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('16 Calle y 7 Av. NO. 159 Puerto Barrios, Izabal', 6);        
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('9 Calle 12-132 Zona 3 Colonia San Antonio, San Marcos', 16);  
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('3ra. Calle 5-13 Zona 1 Villa Nueva, Guatemala', 1);      
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Av. La Brigada 13-92 Zona 7 de Mixco Plan San Ignacio Local 5, Guatemala', 1);      
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Av. Las Américas, 7-62 Zona 3. Primer nivel, oficina 106 Edificio Torre Pradera Xela', 6 );      
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('2da. Calle 1-95 Zona 1 San Francisco El Alto, Totonicapán', 19);  
insert into Oficinas (direccionOficina, codigoDepartamento)
	values(' 10ma. Av 2-60 entre 3ra. Calle y esquina Zona 1, Chiquimula', 4);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Aldea San Juan entrada de Salamá  Km. 146.5 Salamá, Baja Verapaz', 3);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('7ma. Av. Y 7ma. Calle esquina Zona  1 Puerto Barrios, Izabal', 6);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Calzada San Juan 8-58 Zona 7, Guatemala', 1);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values('Boulevard Principal Sector B-6 Lote 8 San Cristobal Zona 8 de Mixco, Guatemala', 1);
insert into Oficinas (direccionOficina, codigoDepartamento)
	values(' Lote 7 Manzana D Colonia Santa Teresita  Zona  2, Chimaltenango', 11);    


-- --- Telefonos ---   

insert into Telefonos (numeroTelefono, codigoOficina)
	values('2104-3604', 1);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4523-6412', 2);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('3599-3212', 3);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('2000-4100', 4);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4412-6945', 5);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('3608-3437', 6);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('2501-1145', 7);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('5554-2410', 8);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('2301-4521', 9);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('2789-3632', 10);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('2022-2200', 11);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('3599-8897', 12);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('5847-4612', 13);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('5875-1119', 14);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('3596-8845', 15);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4198-8293', 16);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4123-9874', 17);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4452-6632', 18);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('5765-6123', 19);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('5512-3612', 20);
insert into Telefonos (numeroTelefono, codigoOficina)
	values('4501-3401', 21);


-- --- DepartamentosEmpresa ---

insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Comercial', 4);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Administración, Contabilidad y Finanzas', 5);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Dirección General', 9);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Informática, Sistemas Y Tecnología', 11);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Producción', 1);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Recursos Humanos', 3);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Logística y Operaciones', 7);
insert into DepartamentosEmpresa (nombreDepartamentoEmpresa, codigoOficina)
	values('Servicios Y Otros', 21);

    
-- --- Empleados ---

insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion, 
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Vinicio Alexander Figueroa Machán', '1970-09-02', 51, '4198-4121', '2019-01-15', 1, 1);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Miguel Ángel Hernández Prado', '2002-09-02', 18, '3404-8856', '2021-01-15', 2, 1);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion, 
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Jessica Liliana Moreno Reveles', '1980-01-25', 40, '3591-9936', '2019-04-16', 3, 1);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Javier Ignacio Molina Cano', '1959-04-15', 61, '4504-9366', '2018-02-15', 4, 1);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Horacio Augusto Moreno Correa ', '1970-10-11', 51, '5572-3204','2018-10-24', 5, 2);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Gloria Azucena Alzate Agudelo', '1959-04-19', 61, '4249-6813', '2020-05-22', 6, 2);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Jose Danilo Ruiz Gonzales', '1988-11-25', 32, '5781-5751', '2017-12-01', 7, 2);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion, 
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Rony Danilo Morales Grijalva', '1990-03-17', 30, '5341-8871', '2018-01-10', 8, 3);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Norma Crisanta Reyes Montenegro', '1976-11-01', 44, '4293-6143', '2021-01-25', 9, 3);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Susan Guadalupe Archila Gomez', '2001-04-19', 19, '5399-4981', '2020-10-26', 10, 3);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Marco Antonio Rios Grijalva', '1973-08-31', 47, '5861-7415', '2018-09-16', 11, 3);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Juan Jose Arevalo Bermejo', '1974-08-31', 46, '4550-7215', '2019-06-04', 12, 4);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Fabio Alexander Florez García', '1972-09-05', 48, '3630-9476', '2021-11-02', 13, 4);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Maria Victoria Arias Gómez', '1994-07-21',  26, '49909-7062', '2020-02-04', 14, 4);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Karen Anahí Sandoval López', '1977-12-31', 43, '5543-2622', '2018-11-11', 15, 4);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Manuel Antonio Fuentes Montoya', '1981-07-21', 39, '3404-4008', '2020-09-30', 16, 5);  
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Jairo Otoniel Peren Gonzales', '1991-07-21', 29, '3503-4486', '2019-03-17', 17, 5); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Leonardo Javier Lima Gomez', '1979-08-30', 41, '4779-2483', '2020-08-07', 18, 6); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Luisa Fernanda Cifuentes Arreaga', '1992-05-16', 28, '5380-2505', '2021-02-02', 19, 6);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Cesar Josue Lopez Arredondo', '1961-04-26', 59, '4801-7335', '2018-01-04', 20, 6); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Emilio Jose Lopez Sandoval', '1984-04-28', 36, '3037-4290', '2020-12-03', 21, 7); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Darlin Mariel Lopez Osorio', '1995-07-21', 25, '3312-5008', '2019-04-29', 22, 7); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Sara Daniela Ponciano Villa', '1998-01-09', 22, '4168-3298', '2021-02-02', 23, 7); 
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Eduardo Gamaliel Ruiz Vazquez', '1969-03-24', 51, '5974-4480', '2019-06-23', 24, 8);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Ana Maria Barillas Lopez', '1999-07-24', 21, '4521-0140', '2021-01-23', 25, 8);    
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Jose David Reyes Salazar', '1961-03-21', 59, '5002-4855', '2019-07-04', 26, 8);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Henry Sebastian Lopez Villa', '1960-04-27', 60, '5001-2345', '2018-05-02', 27, 8);
insert into Empleados (nombreEmpleado, fechaNacimiento, edadEmpleado, telefonoEmpleado, fechaContratacion,
			codigoTipoEmpleado, codigoDepartamentoEmpresa)
	values ('Rodrigo Gerardo Cárdenas Monroy', '2002-11-07', 60, '5579-8278', '2018-05-02', 13, 4);



/* CONSULTAS -> QUERYS */


-- Consulta 1:
-- Nombre y Edad de los Empleados

CREATE PROCEDURE sp_edades_nombres
AS
BEGIN
	SELECT E.nombreEmpleado, E.edadEmpleado
		FROM Empleados E;
END

EXECUTE sp_edades_nombres;


-- Consulta 3:
-- 3) Fecha de contratación de cada empleado. 

CREATE PROCEDURE sp_fechaContratacion_empleado
AS
BEGIN
	SELECT E.nombreEmpleado, E.fechaContratacion
		FROM Empleados E;
END

EXECUTE sp_fechaContratacion_empleado;


-- Consulta 4:  
-- 4) Edades de los empleados.

CREATE PROCEDURE sp_edades_empleados
AS
BEGIN
	SELECT E.nombreEmpleado, E.edadEmpleado
		FROM Empleados E;
END

EXECUTE sp_edades_empleados;


-- Consulta 5:
-- 5) Número de empleados que hay para cada una de las edades.
CREATE PROCEDURE sp_total_edades
AS
BEGIN
	SELECT COUNT(*) AS total, E.edadEmpleado
		FROM Empleados E group by E.edadEmpleado;
END

EXECUTE sp_total_edades;


-- Consulta 6:
-- 6) Edad media de los empleados por departamento.

SELECT AVG(E.edadEmpleado) AS mediaEdad, DE.nombreDepartamentoEmpresa
	FROM DepartamentosEmpresa DE 
		INNER JOIN Empleados E
			ON DE.codigoDepartamentoEmpresa = E.codigoDepartamentoEmpresa
				GROUP BY DE.nombreDepartamentoEmpresa;


-- Consulta 7:
-- 7) Tipos de Empleados que superan las 35.000 de salario. 
SELECT TE.nombreTipoEmpleado, CONCAT('Q.',(TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa)) as TotalDevengado
	FROM TipoEmpleado TE
		WHERE (TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa) > 35000;


-- Consulta 8:
/* 8) Datos del empleado número X.
	  X = codigoEmpleado
	  codigoEmpleado = 18 */
CREATE PROCEDURE sp_datos_empleado
@EMPLEADO_ID INT
AS
BEGIN
	SELECT * FROM Empleados E
		WHERE E.codigoEmpleado = @EMPLEADO_ID;
END

EXECUTE sp_datos_empleado 1;


-- Consulta 9:
  /*9)	Empleados del departamento de empresa X.
		X = codigoDepartamentoEmpresa
        codigoDepartamentoempresa = 7 */
CREATE PROCEDURE sp_empleados_departamentoEmpresa
@CODIGO_EMPLEADO_ID INT
AS
BEGIN
	SELECT E.nombreEmpleado, DE.nombreDepartamentoEmpresa
		FROM Empleados E 
			INNER JOIN DepartamentosEmpresa DE
				ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa
					AND DE.codigoDepartamentoEmpresa = @CODIGO_EMPLEADO_ID
END

EXECUTE sp_empleados_departamentoEmpresa 8;


-- Consulta 10:         
/* 10)	Empleados cuya contratación se produjo en el año X.
		x = fechaDeContratacion
		fechaDeContratacion = 2019*/
CREATE PROCEDURE sp_empleado_fechaContratacion
@YEAR_PARAMETER INT
AS
BEGIN
	SELECT E.nombreEmpleado, YEAR(E.fechaContratacion) AS Anio
		FROM Empleados E
			WHERE YEAR(E.fechaContratacion) = @YEAR_PARAMETER
END

EXECUTE sp_empleado_fechaContratacion 2020;


-- Consulta 11:
/* 11) Empleados que no sean jefe de Departamento 
	  (atributo nombreTipoEmpleado dentro de la entidad TipoEmpleados) X
       X = codigoDepartamento
       X = 4 */

CREATE PROCEDURE sp_empleados_noJefe
@DEPARTAMENTO_ID INT
AS
BEGIN
		SELECT E.nombreEmpleado, TE.nombreTipoEmpleado, DE.nombreDepartamentoEmpresa
			FROM Empleados E
				INNER JOIN DepartamentosEmpresa DE
					ON DE.codigoDepartamentoEmpresa = E.codigoDepartamentoEmpresa
				INNER JOIN TipoEmpleado TE
					ON TE.codigoTipoEmpleado = E.codigoTipoEmpleado
					AND (TE.nombreTipoEmpleado NOT LIKE '%Jefe%'
							AND TE.nombreTipoEmpleado NOT LIKE '%Gerente%')
					AND DE.codigoDepartamentoEmpresa = @DEPARTAMENTO_ID;
END

EXECUTE sp_empleados_noJefe 6


-- Consulta 12:                       
/* 12)	Empleados contratados entre los años X y X 
		X = 2019
        Y = 2021 */

CREATE PROCEDURE sp_fechasContrataciones
@PRIMER_YEAR INT,
@SEGUNDO_YEAR INT
AS
BEGIN
	SELECT E.nombreEmpleado, YEAR(E.fechaContratacion) AS Contratacion
		FROM Empleados E
			WHERE 
				YEAR(E.fechaContratacion) 
					BETWEEN @PRIMER_YEAR AND @SEGUNDO_YEAR;
END

EXECUTE sp_fechasContrataciones 2018, 2020;


-- Consulta 13:
-- 13)	Tipos de Empleado que tienen un salario superior a 35.000 e inferior a 40.000.

CREATE PROCEDURE sp_consulta_salarios
@RANGO_UNO INT,
@RANGO_DOS INT
AS
BEGIN
	SELECT TE.nombreTipoEmpleado, 
		CONCAT('Q', (TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa)) AS Líquido
			FROM TipoEmpleado TE
				WHERE (TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa) 
					BETWEEN @RANGO_UNO AND @RANGO_DOS;
END

EXECUTE sp_consulta_salarios 5000, 10000;


-- Consulta 14:
-- 14)	Empleados cuyo tipo de empleado es director o jefe de sección 

SELECT E.nombreEmpleado, TE.nombreTipoEmpleado, DE.nombreDepartamentoEmpresa	
	FROM Empleados E
		INNER JOIN DepartamentosEmpresa DE
			ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa
		INNER JOIN TipoEmpleado TE
			ON E.codigoTipoEmpleado = TE.codigoTipoEmpleado
			AND (TE.nombreTipoEmpleado LIKE '%Jefe%' OR TE.nombreTipoEmpleado LIKE '%Gerente%');


-- Consulta 15:
-- 15)	Empleados de nombre 'Jose'    
SELECT * FROM Empleados E
	WHERE E.nombreEmpleado LIKE '%Jose%';


-- Consulta 16:
-- 16)	Empleados que pertenecen al departamento administrativo y que tienen una edad mayor a 35 años.
SELECT E.nombreEmpleado, E.edadEmpleado, DE.nombreDepartamentoEmpresa
	FROM Empleados E
		INNER JOIN DepartamentosEmpresa DE
			ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa
				AND DE.codigoDepartamentoEmpresa = 2
					AND E.edadEmpleado > 35;


-- Consulta 17:
/* 17)	Empleados que no pertenecen al departamento de la empresa X
		x = codigoDepartamentoEmpresa
		codigoDepartamentoEmpresa = 2*/

CREATE PROCEDURE sp_empleados_noPertenecen
@DEPARTAMENTO_ID INT
AS
BEGIN
	SELECT E.nombreEmpleado, DE.nombreDepartamentoEmpresa
		FROM Empleados E
			INNER JOIN DepartamentosEmpresa DE
				ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa
					AND DE.codigoDepartamentoEmpresa <> @DEPARTAMENTO_ID
END

EXECUTE sp_empleados_noPertenecen 4


-- Consulta 18:
-- 18)	Nombre y edad de los empleados ordenados de menor a mayor edad.
SELECT E.nombreEmpleado, E.edadEmpleado
	FROM Empleados E
		ORDER BY E.edadEmpleado ASC;


-- Consulta 19:
-- 19)	Nombre y edad de los empleados ordenados por nombre de forma descendente.
SELECT E.nombreEmpleado, E.edadEmpleado
	FROM Empleados E
		ORDER BY E.edadEmpleado DESC;


-- Consulta 20:
-- 20)	Nombre del empleado y el departamento de la empresa en la que trabaja. 
SELECT E.nombreEmpleado, DE.nombreDepartamentoEmpresa
	FROM Empleados E
		INNER JOIN DepartamentosEmpresa DE
			ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa;


-- Consulta 21:
-- 21)	Código y teléfonos de los departamentos de las oficinas de la región 'Centro'.

-- 1. DEPARTAMENTOS DE GUATEMALA
SELECT D.codigoDepartamento, D.nombreDepartamento, O.direccionOficina, T.numeroTelefono, R.nombreRegion
	FROM Departamentos D
		INNER JOIN Regiones R
			ON D.codigoRegion = R.codigoRegion
		INNER JOIN Oficinas O
			ON D.codigoDepartamento = O.codigoDepartamento
		INNER JOIN Telefonos T
			ON T.codigoOficina = O.codigoOficina
				AND R.nombreRegion LIKE '%Metropolitana%';

exec sp_columns Oficinas

-- 2. DEPARTAMENTOS DE LA EMPRESA               
SELECT DE.codigoDepartamentoEmpresa, DE.nombreDepartamentoEmpresa, O.direccionOficina, T.numeroTelefono, R.nombreRegion
	FROM Departamentos D
		INNER JOIN Regiones R
			ON D.codigoRegion = R.codigoRegion
		INNER JOIN Oficinas O
			ON O.codigoDepartamento = O.codigoDepartamento
		INNER JOIN Telefonos T
			ON T.codigoOficina = O.codigoOficina
		INNER JOIN DepartamentosEmpresa DE
			ON DE.codigoOficina = O.codigoOficina
				AND R.nombreRegion LIKE '%Metropolitana%';


-- Consulta 22:
-- 22)	Nombre del empleado y departamento de Guatemala en el que trabaja.
SELECT E.nombreEmpleado, DE.nombreDepartamentoEmpresa, D.nombreDepartamento
	FROM Empleados E
		INNER JOIN DepartamentosEmpresa DE
			ON E.codigoDepartamentoEmpresa = DE.codigoDepartamentoEmpresa
		INNER JOIN Oficinas O
			ON DE.codigoOficina = O.codigoOficina
		INNER JOIN Departamentos D
			ON O.codigoDepartamento = D.codigoDepartamento;


-- Consulta 23:
-- 23)	Sueldo de cada empleado y sus bonificaciones.
SELECT E.nombreEmpleado, TE.nombreTipoEmpleado, 
		TE.sueldoBase, TE.bonificacion, TE.bonificacionEmpresa, DE.nombreDepartamentoEmpresa
			FROM Empleados E
				INNER JOIN TipoEmpleado TE
					ON TE.codigoTipoEmpleado = E.codigoTipoEmpleado
				INNER JOIN DepartamentosEmpresa DE
					ON DE.codigoDepartamentoEmpresa = E.codigoDepartamentoEmpresa;						


-- Consulta 24:
-- 24)	Nombre de los empleados y de sus jefes de departamento.
SELECT E.nombreEmpleado AS Empleado, J.nombreEmpleado AS Jefe, DE1.nombreDepartamentoEmpresa
	FROM Empleados E
		INNER JOIN TipoEmpleado TE1
			ON TE1.codigoTipoEmpleado = E.codigoTipoEmpleado
			AND (TE1.nombreTipoEmpleado NOT LIKE '%Jefe%' AND TE1.nombreTipoEmpleado NOT LIKE '%Gerente%')
		INNER JOIN Empleados J
			ON J.codigoTipoEmpleado = J.codigoTipoEmpleado
		INNER JOIN TipoEmpleado TE2
			ON TE2.codigoTipoEmpleado = J.codigoTipoEmpleado
			AND (TE2.nombreTipoEmpleado LIKE '%Jefe%' OR TE2.nombreTipoEmpleado LIKE '%Gerente%')
		INNER JOIN DepartamentosEmpresa DE1
			ON DE1.codigoDepartamentoEmpresa = E.codigoDepartamentoEmpresa
				AND DE1.codigoDepartamentoEmpresa = J.codigoDepartamentoEmpresa


-- Consulta 25:
-- 25)	Suma del sueldo de los empleados, sin la bonificación  
SELECT CONCAT('Q.', ROUND(SUM(TE.sueldoBase),2, 1)) AS Total
	FROM TipoEmpleado TE;


-- Consulta 26:
-- 26)	Promedio del sueldo, sin contar bonificación
SELECT CONCAT('Q.',CAST(ROUND(AVG(TE.sueldoBase),2,1) AS DECIMAL(10,2))) AS PromedioSueldos
	FROM TipoEmpleado TE;


-- Consulta 27:
-- 27)	Salarios máximo y mínimo de los empleados, incluyendo bonificación.
SELECT MAX(TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa) AS SueldoMaximo,
	   MIN(TE.sueldoBase + TE.bonificacion + TE.bonificacionEmpresa) AS SueldoMinimo
	FROM TipoEmpleado TE;


-- Consulta 28:
-- 28)	Número de empleados que superan los 40 años.
SELECT COUNT(E.edadEmpleado) AS Cantidad
	FROM Empleados E
		WHERE E.edadEmpleado > 40;


-- Consulta 29:
-- Número de edades diferentes que tienen los empleados.
SELECT COUNT(DISTINCT E.edadEmpleado) AS Cantidad
	FROM Empleados E;