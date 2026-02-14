create or alter procedure spSeccionInsert @claseid int, @alumnoid int, @nota int
as
	begin transaction 
		declare @id int, @err int = 0

		select @id = isnull(max(SeccionID), 0) + 1 from Seccion 

		insert into Seccion values(@id, @claseid, @alumnoid, @nota)
		if @@ERROR != 0 select @err = -1

		update Clase
		   set Aprobados = Aprobados + case when @nota > 64 then 1 else 0 end,
		       Reprobados = Reprobados + case when @nota < 65 then 1 else 0 end
		 where ClaseID = @claseid

		if @@ERROR != 0 select @err = -1

		update Alumno
		   set Promedio = (select avg(Nota) from Seccion where AlumnoID = @alumnoid)
         where AlumnoID = @alumnoid
		if @@ERROR != 0 select @err = -1

		if @err = 0
			commit
		else
			rollback
go

insert into alumno values(1, 'Juan', 0), (2, 'Jose', 0), (3, 'Maria', 0)
insert into	clase values(1, 'DB1', 0, 0), (2 ,'DB2', 0, 0)

select * from alumno; select * from Clase; select * from Seccion

exec spSeccionInsert 1, 1, 80
exec spSeccionInsert 1, 2, 100
exec spSeccionInsert 2, 1, 60
