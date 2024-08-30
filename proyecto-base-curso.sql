--liquibase formatted sql
 
--changeset victor:1
--comment: Creación de la tabla Persona
CREATE TABLE Persona (
    ID_Persona INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CURP VARCHAR(18),
    Fecha_nacimiento DATE,
    Email VARCHAR(50),
    Constraseña VARCHAR(50)
);
 
--changeset victor:2
--comment: Creación de la tabla Aulas
CREATE TABLE Aulas (
    ID_Aula INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Capacidad INT
);
 
--changeset victor:3
--comment: Creación de la tabla CitaPorSalon
CREATE TABLE CitaPorSalon (
    ID_CitaSalon INT PRIMARY KEY,
    ID_Cita INT,
    ID_Aula INT,
    ID_Curso INT
);
 
--changeset victor:4
--comment: Creación de la tabla Mensajes
CREATE TABLE Mensajes (
    ID_Mensaje INT PRIMARY KEY AUTO_INCREMENT,
    ID_Persona INT,
    Emisor INT,
    Receptor INT,
    Contenido TEXT,
    Fecha DATE
);
 
--changeset victor:5
--comment: Creación de la tabla solicitudes_inscripcion
CREATE TABLE solicitudes_inscripcion (
    ID_solicitud INT PRIMARY KEY,
    ID_ListaEspera INT,
    ID_Estudiante INT,
    FechaSolicitud DATE,
    Aprobada BOOLEAN
);
 
--changeset victor:6
--comment: Creación de la tabla Foros
CREATE TABLE Foros (
    ID_Foro INT PRIMARY KEY AUTO_INCREMENT,
    Tema VARCHAR(50),
    Descripcion TEXT,
    Fecha_Creacion DATE,
    ID_Curso INT
);
 
--changeset victor:7
--comment: Creación de la tabla Asistencia
CREATE TABLE Asistencia (
    ID_Asistencia INT PRIMARY KEY,
    ID_Curso INT NOT NULL,
    ID_Estudiante INT NOT NULL,
    Fecha DATE NOT NULL,
    Estado TINYINT NOT NULL
);
 
--changeset victor:8
--comment: Creación de la tabla HistorialAcademico
CREATE TABLE HistorialAcademico (
    ID_HAcademico INT PRIMARY KEY,
    ID_Estudiante INT,
    Promedio_gral INT,
    RAsistencia TEXT,
    Retroalimentacion TEXT
);
 
--changeset victor:9
--comment: Creación de la tabla Estudiante
CREATE TABLE Estudiante (
    ID_Estudiante INT PRIMARY KEY,
    ID_Persona INT
);
 
--changeset victor:10
--comment: Creación de la tabla TipoAsignacion
CREATE TABLE TipoAsignacion (
    ID_Tipo INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50)
);
 
--changeset victor:11
--comment: Creación de la tabla EntregasAsignacion
CREATE TABLE EntregasAsignacion (
    ID_Entrega INT AUTO_INCREMENT PRIMARY KEY,
    ID_Asignacion INT,
    ID_Estudiante INT,
    Calificacion INT,
    Estado VARCHAR(50),
    Retroalimentacion VARCHAR(255)
);
 
--changeset victor:12
--comment: Creación de la tabla Asignaciones
CREATE TABLE Asignaciones (
    ID_Asignacion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Curso INT,
    ID_Tipo INT,
    Titulo VARCHAR(100),
    Descripcion VARCHAR(100),
    Archivo VARCHAR(100)
);
 
--changeset victor:13
--comment: Creación de la tabla Citas
CREATE TABLE Citas (
    ID_Cita INT PRIMARY KEY,
    Día DATE,
    Hora_inicio TIME,
    Hora_fin TIME
);
 
--changeset victor:14
--comment: Creación de la tabla Mensajes_de_Foro
CREATE TABLE Mensajes_de_Foro (
    ID_MForo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Foro INT,
    ID_Estudiante INT,
    Mensaje TEXT,
    Fecha_Envio DATE
);
 
--changeset victor:15
--comment: Creación de la tabla Cursos
CREATE TABLE Cursos (
    ID_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ID_Instructor INT,
    Descripcion VARCHAR(50),
    Estado VARCHAR(50)
);
 
--changeset victor:16
--comment: Creación de la tabla Materiales
CREATE TABLE Materiales (
    ID_Material INT PRIMARY KEY AUTO_INCREMENT,
    ID_Curso INT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(50),
    FPublicacion DATE,
    URL VARCHAR(250)
);
 
--changeset victor:17
--comment: Creación de la tabla Instructores
CREATE TABLE Instructores (
    ID_Instructor INT PRIMARY KEY,
    ID_Persona INT
);
 
--changeset victor:18
--comment: Creación de la tabla Administradores
CREATE TABLE Administradores (
    ID_Administrador INT PRIMARY KEY,
    ID_Persona INT
);
 
--changeset victor:19
--comment: Creación de la llave foránea en la tabla Materiales para la columna ID_Curso
ALTER TABLE Materiales
ADD CONSTRAINT FK_Materiales_Cursos
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);
 
--changeset victor:20
--comment: Creación de la llave foránea en la tabla Cursos para la columna ID_Instructor
ALTER TABLE Cursos
ADD CONSTRAINT FK_Cursos_Instructores
FOREIGN KEY (ID_Instructor) REFERENCES Instructores(ID_Instructor);
 
--changeset victor:21
--comment: Creación de la llave foránea en la tabla Mensajes para la columna ID_Persona
ALTER TABLE Mensajes
ADD CONSTRAINT FK_Mensajes_Persona
FOREIGN KEY (ID_Persona) REFERENCES Persona(ID_Persona);
 
--changeset victor:22
--comment: Creación de la llave foránea en la tabla Estudiante para la columna ID_Persona
ALTER TABLE Estudiante
ADD CONSTRAINT FK_Estudiante_Persona
FOREIGN KEY (ID_Persona) REFERENCES Persona(ID_Persona);
 
--changeset victor:23
--comment: Creación de la llave foránea en la tabla Asignaciones para la columna ID_Curso
ALTER TABLE Asignaciones
ADD CONSTRAINT FK_Asignaciones_Curso
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);
 
--changeset victor:24
--comment: Creación de la llave foránea en la tabla Asignaciones para la columna ID_Tipo
ALTER TABLE Asignaciones
ADD CONSTRAINT FK_Asignaciones_Tipo
FOREIGN KEY (ID_Tipo) REFERENCES TipoAsignacion(ID_Tipo);
 
--changeset victor:25
--comment: Creación de la llave foránea en la tabla Instructores para la columna ID_Persona
ALTER TABLE Instructores
ADD CONSTRAINT FK_Instructores_Persona
FOREIGN KEY (ID_Persona) REFERENCES Persona(ID_Persona);
 
--changeset victor:26
--comment: Creación de la llave foránea en la tabla Asistencia para la columna ID_Curso
ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Cursos
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);
 
--changeset victor:27
--comment: Creación de la llave foránea en la tabla Asistencia para la columna ID_Estudiante
ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Estudiante
FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante);
 
--changeset victor:28
--comment: Creación de la llave foránea en la tabla HistorialAcademico para la columna ID_Estudiante
ALTER TABLE HistorialAcademico
ADD CONSTRAINT FK_HistorialAcademico_Estudiante
FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante);
 
--changeset victor:29
--comment: Agregar clave foránea FK_Asignacion a la tabla EntregasAsignacion
ALTER TABLE EntregasAsignacion
ADD CONSTRAINT FK_EntregasAsignacion_Asignacion
FOREIGN KEY (ID_Asignacion) REFERENCES Asignaciones(ID_Asignacion);
 
--changeset victor:30
--comment: Agregar clave foránea FK_Estudiante a la tabla EntregasAsignacion
ALTER TABLE EntregasAsignacion
ADD CONSTRAINT FK_EntregasAsignacion_Estudiante
FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante);
 
--changeset victor:31
--comment: Llave foránea de Estudiante en solicitudes_inscripcion
ALTER TABLE solicitudes_inscripcion
ADD CONSTRAINT FK_solicitudes_inscripcion_Estudiante
FOREIGN KEY (ID_Estudiante)
REFERENCES Estudiante(ID_Estudiante);
 
--changeset victor:32
--comment: Llave foránea de Foros en Mensajes_de_Foro
ALTER TABLE Mensajes_de_Foro
ADD CONSTRAINT FK_Mensajes_de_Foro_Foro
FOREIGN KEY (ID_Foro) REFERENCES Foros(ID_Foro);
 
--changeset victor:33
--comment: Llave foránea de Estudiante en Mensajes_de_Foro
ALTER TABLE Mensajes_de_Foro
ADD CONSTRAINT FK_Mensajes_de_Foro_Estudiante
FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante);
 
--changeset victor:34
--comment: Llave foránea de Curso en CitaPorSalon
ALTER TABLE CitaPorSalon
ADD CONSTRAINT FK_CitaPorSalon_Curso
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);
 
--changeset victor:35
--comment: Llave foránea de Aula en CitaPorSalon
ALTER TABLE CitaPorSalon
ADD CONSTRAINT FK_CitaPorSalon_Aula
FOREIGN KEY (ID_Aula) REFERENCES Aulas(ID_Aula);
 
--changeset victor:36
--comment: Llave foránea de Citas en CitaPorSalon
ALTER TABLE CitaPorSalon
ADD CONSTRAINT FK_CitaPorSalon_Cita
FOREIGN KEY (ID_Cita) REFERENCES Citas(ID_Cita);
 
--changeset victor:37
--comment: Llave foránea de Curso en Foros
ALTER TABLE Foros
ADD CONSTRAINT FK_Foros_Curso
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);