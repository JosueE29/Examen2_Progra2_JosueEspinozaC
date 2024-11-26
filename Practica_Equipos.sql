Create database Practica_Equipos;
GO

USE Practica_Equipos;
GO
--Mediante el NVARCHAR se logra popder agregar cualquier tipo de caracter incluyendo valores especiales o diferentes idiomas
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    CorreoElectronico NVARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY,
    TipoEquipo NVARCHAR(50),
    Modelo NVARCHAR(50),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY,
    NombreTecnico VARCHAR(100),
    Especialidad NVARCHAR(50)
);

CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY,
    EquipoID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(20),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY,
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);

CREATE TABLE DetallesReparacion (
    DetalleID INT PRIMARY KEY,
    ReparacionID INT,
    Descripcion NVARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);
INSERT INTO Usuarios (UsuarioID, Nombre, CorreoElectronico, Telefono)
VALUES (1010, 'Josue', 'Josue092930@gmail.com', '85845076');
INSERT INTO Usuarios (UsuarioID, Nombre, CorreoElectronico, Telefono)
VALUES (1011, 'David', 'David081230@gmail.com', '85843076');
INSERT INTO Usuarios (UsuarioID, Nombre, CorreoElectronico, Telefono)
VALUES (1021, 'Fernando', 'Miguelito@gmail.com', '85848800');

INSERT INTO Equipos (EquipoID, TipoEquipo, Modelo, UsuarioID)
VALUES (12201, 'Laptop', 'AsusGamer', 1010	);
INSERT INTO Equipos (EquipoID, TipoEquipo, Modelo, UsuarioID)
VALUES (12202, 'Escritorio', 'IntelCore', 1010	);

INSERT INTO Tecnicos (TecnicoID, NombreTecnico, Especialidad)
VALUES (102, 'Johan', 'PCS GAMER');
INSERT INTO Tecnicos (TecnicoID, NombreTecnico, Especialidad)
VALUES (103, 'Miguel', 'Escritorio');
INSERT INTO Tecnicos (TecnicoID, NombreTecnico, Especialidad)
VALUES (103, 'Esteban', 'PCS GAMER');

DELETE FROM Usuarios WHERE UsuarioID = 1011;
DELETE FROM Equipos WHERE EquipoID = 12202;
DELETE FROM Tecnicos WHERE TecnicoID = 103;

SELECT * FROM Usuarios WHERE Nombre = 'Josue';
SELECT * FROM Equipos WHERE TipoEquipo = 'Laptop';
SELECT * FROM Tecnicos WHERE Especialidad = 'PC´S GAMER';

UPDATE Usuarios
SET CorreoElectronico = 'nuevocorreo@gmail.com', Telefono = '88745200'
WHERE UsuarioID = 1011;

SELECT * FROM Usuarios;
SELECT * FROM Equipos;
SELECT * FROM Tecnicos;

--------------Procedimientos Almacenados
------Ingresar

create procedure IngresarUsuario
@UsuarioID INT,
@Nombre NVARCHAR(100),
@CorreoElectronico NVARCHAR(100),
@Telefono INT
AS
BEGIN
    INSERT INTO Usuarios (UsuarioID,Nombre, CorreoElectronico, Telefono)
    VALUES (@UsuarioID, @Nombre, @CorreoElectronico, @Telefono);
END

create procedure ConsultarUsuarios
as
begin
    select * from Usuarios;
end

create procedure BorrarUsuario
@UsuarioID int
as
begin
    delete from Usuarios where UsuarioID = @UsuarioID;
end

create procedure ModificarUsuario
@UsuarioID int,
@Nombre nvarchar(100),
@CorreoElectronico nvarchar(100),
@Telefono varchar(20)
as
begin
    UPDATE Usuarios
    set Nombre = @Nombre, CorreoElectronico = @CorreoElectronico, Telefono = @Telefono
    where UsuarioID = @UsuarioID;
end

create procedure IngresarEquipo
@EquipoID int,
@TipoEquipo nvarchar(50),
@Modelo nvarchar(50),
@UsuarioID int
as
begin
    insert into Equipos (EquipoID, TipoEquipo, Modelo, UsuarioID)
    values (@EquipoID, @TipoEquipo, @Modelo, @UsuarioID);
end

create procedure ConsultarEquipos
as
begin
    select * from Equipos;
end

create procedure BorrarEquipo
@EquipoID int
as
begin
    delete from Equipos where EquipoID = @EquipoID;
end

create procedure ModificarEquipo
@EquipoID int,
@TipoEquipo nvarchar(50),
@Modelo nvarchar(50),
@UsuarioID int
as
begin
    UPDATE Equipos
    set TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID = @UsuarioID
    where EquipoID = @EquipoID;
end

create procedure ingresar_tecnico
@tecnico_id int,
@nombre varchar(100),
@especialidad nvarchar(50)
as
begin
    insert into tecnicos (tecnicoid, nombre, especialidad)
    values (@tecnico_id, @nombre, @especialidad);
end

create procedure consultar_tecnicos
as
begin
    select * from tecnicos;
end

create procedure borrar_tecnico
@tecnico_id int
as
begin
    delete from tecnicos where tecnicoid = @tecnico_id;
end

create procedure modificar_tecnico
@tecnico_id int,
@nombre varchar(100),
@especialidad nvarchar(50)
as
begin
    UPDATE tecnicos
    set nombre = @nombre, especialidad = @especialidad
    where tecnicoid = @tecnico_id;
end

exec ConsultarUsuarios
