drop table Alumno
drop table Clase
drop table Seccion

create table Alumno
(
	AlumnoID	int not null,
	Nombre		varchar(50),
	Promedio	float not null,
		
	constraint chkPromedio check (Promedio between 0 and 100)
)

create table Clase
(
	ClaseID		int not null,
	Materia		varchar(50) not null,
	Aprobados	int not null,
	Reprobados	int not null,
	constraint chkAprueban check (Aprobados >= Reprobados)
)

create table Seccion
(
	SeccionID	int not null,
	ClaseID		int not null,
	AlumnoID	int not null,
	Nota		int not null
)

/*
	Hacer un procedimiento almacenado llamada spSeccionInsert que ademas de insertar un registro en la tabla 'seccion
	actualice las cantidad de aprobados y reprobados de la clase y el promedio del alumno
*/