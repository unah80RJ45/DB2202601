-- Copiar a su base de datos las tablas Cheque, Banco y Proveedor de la Base de datos DemoBD
-- hacer un sp que me muestre como resultado ya se el total de cheques y el valor de un banco especifico o de un proveedor especifico.

create or alter procedure spCheques @banco int = 0, @proveedor int = 0
as
	select * into #cheque from Cheque where (BancoID = @banco or @banco = 0) and (ProveedorID = @proveedor or @proveedor = 0)
	select * into #banco from Banco where bancoid = @banco
	select * into #proveedor from Proveedor where ProveedorID = @proveedor

	select Codigo = isnull(p.ProveedorID, b.BancoID), Nombre = isnull(p.Nombre, b.Nombre), Valor
	into #chequeCodigo from #cheque c
	left join #proveedor as p on c.proveedorid = p.ProveedorID
	left join #banco b on c.bancoid = b.bancoid

	select Codigo, Nombre, count(*) Cantidad, sum(Valor) Valor
	from #chequeCodigo
	group by Codigo, Nombre
go

exec spCheques @banco = 5
exec spCheques @proveedor = 1

-- select * from cheque

--select * into Proveedor from DemoDB.dbo.Proveedor
