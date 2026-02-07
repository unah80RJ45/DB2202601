
create or alter procedure spProveedorInsert @id int output, @nombre varchar(50)
as
	select @id = isnull(max(ProveedorID), 0) + 1 from Proveedor 
	insert into Proveedor values(@id, @nombre)
go

create or alter procedure spCompraInsert @nombre varchar(50), @valor float
as
	declare @pID as int, @cID as int
	select @pID = max(ProveedorID) from Proveedor where Nombre = @nombre

	if @pID is null
		begin
			exec spProveedorInsert @pID output, @nombre 
		end

	select @cID = isnull(max(CompraID), 0) + 1 from Compra 
	insert into Compra values(@cID, @pID, @valor)
	select * from proveedor where proveedorid = @pID
	select * from compra where compraid = @cID
go

/* Hacer un procedimiento para insertar un banco y un procedimiento para insert un deposito
	si el banco no existe al momento de crear el deposito mandar a crear el banco usando el procedimiento de insertar banco
*/