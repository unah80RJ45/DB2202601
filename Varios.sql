create or alter view vCantidadALumnosCarrera
as
	select CarreraID, NombreCarrera, count(*) as CantidadAlumnos
	from vAlumnoCarrera
	group by CarreraID, NombreCarrera
go
select * from vAlumnoCarrera; select * from vCantidadALumnosCarrera
insert into Alumno values(4, 'Miguel', 3); insert into Carrera values(4, 'Informatica'); create or alter view vNombres
as
	select Nombre, 'A' as Tipo from Alumno
	union
	select Nombre, 'C' from Carrera
	union
	select Nombre, 'M' from Materia
go
select * from vNombres where tipo = 'M'
create or alter view vCarreraSinAlumnos
with encryption
as
	select *
	from Carrera 
	where CarreraID not in(select CarreraID from Alumno)
go

select * from vCantidadALumnosCarrera
select * from vCarreraSinAlumnos

insert into Alumno values(5, 'Maria', 4)

