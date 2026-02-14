drop procedure spAjusteInsert
go

create procedure spAjusteInsert @tipo varchar(1), @productoid int, @cantidad int, @descripcion varchar(100)
as
	begin transaction
	declare @id as int, @err int = 0

	select @id = isnull(max(AjusteID), 0) + 1 from Ajuste

	insert into Ajuste values(@id, @tipo, @productoid, @cantidad, @descripcion)
	if @@ERROR != 0 select @err = -1

	update Producto set Existencia = Existencia + @cantidad * case @tipo when 'E' then 1 else - 1 end 
	where ProductoID = @productoid
	if @@ERROR != 0 select @err = -1

	select * from Producto where ProductoID = @productoid
	if @@ERROR != 0 select @err = -1

	if @err = 0
		commit
	else
		rollback
go

exec spAjusteInsert 'E', 1, 10, 'Inventario Incial'
exec spAjusteInsert 'E', 2, 5, 'Inventario Incial'
exec spAjusteInsert 'S', 1, 4, 'Asignacion al Departamento de Contabilidad'
exec spAjusteInsert 'S', 1, 4, 'Asignacion al Departamento de Tienda'
exec spAjusteInsert 'E', 3, 4, 'Compra No. 1123'
exec spAjusteInsert 'S', 1, 2, 'Asignacion al Departamento de Produccion'


delete from Ajuste where AjusteID = 6
