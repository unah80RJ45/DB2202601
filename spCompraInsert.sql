--delete from proveedor 
--delete from compra

--create table Proveedor 
--(
--	ProveedorID		int null,
--	Nombre			varchar(50)
--)
--create table Compra
--(
--	CompraID		int not null,
--	ProveedorID		int not null,
--	Valor			float
--)

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

exec spCompraInsert 'Proveedor ABCD', 10000

select * from proveedor
select * from compra 
