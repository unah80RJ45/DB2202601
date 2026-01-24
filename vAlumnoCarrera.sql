drop view vAlumnoCarrera 
go

create view vAlumnoCarrera
as
	select a.AlumnoID, a.Nombre as NombreAlumno, a.CarreraID, c.Nombre as NombreCarrera
	from Alumno a
	inner join Carrera c on a.CarreraID = c.CarreraID
go

select * from vAlumnoCarrera

select * from 
(
	select a.AlumnoID, a.Nombre as NombreAlumno, a.CarreraID, c.Nombre as NombreCarrera
	from Alumno a
	inner join Carrera c on a.CarreraID = c.CarreraID
) a