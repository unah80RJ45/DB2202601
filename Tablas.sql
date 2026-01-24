create table Carrera
(
	CarreraID	int not null,
	Nombre		varchar(50) not null
)

create table Alumno
(
	AlumnoID	int not null,
	Nombre		varchar(50) not null,
	CarreraID	int not null
)

insert into Carrera values(1, 'Ing. Sistemas'), (2, 'Medicina'), (3, 'Periodismo')
insert into Alumno values(1, 'Juan', 2), (2, 'Pedro', 2), (3, 'Maria', 1)

create table Materia
(
	MateriaID	int not null,
	Nombre		varchar(50) not null
)
insert into Materia values(1, 'DB1'), (2, 'DB2')
create table Clase
(
	AlumnoID	int not null,
	MateriaID	int not null,
	Nota		varchar(50) not null
)

insert into Clase values(1, 1, 80), (2, 2, 90), (3, 1, 85)
