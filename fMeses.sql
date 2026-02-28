create or alter function dbo.fMeses() returns @meses table (Mes int, Nombre varchar(20))
as
	begin
		insert into @meses values(1, 'Enero'), (2, 'Febrero'), (3, 'Marzo'), (4, 'Abri'),
		(5, 'Mayo'), (6, 'Junio')

		return
	end
go

select *
from dbo.fMeses()

