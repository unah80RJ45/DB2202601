
create view vClase
as
	select c.AlumnoID, ac.NombreAlumno, ac.CarreraID, ac.NombreCarrera, c.MateriaID, m.Nombre as NombreMateria, c.Nota
	from Clase c
	inner join Materia m on c.MateriaID = m.MateriaID
	inner join vAlumnoCarrera ac on c.AlumnoID = ac.AlumnoID
go

select * from vClase

