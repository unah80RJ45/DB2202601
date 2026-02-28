create or alter function dbo.fTotalCliente(@cliente int) returns float
as
	begin	
		declare @valor float
		declare @factura table (FacturaID int)
		declare @facturadetalle table (FacturaID int, Cantidad int, Precio float, ISV float)

		insert @factura (FacturaID)
		select FacturaID from Factura where ClienteID = @cliente

		insert into @facturadetalle
		select FacturaID, Cantidad, Precio, ISV
		from facturadetalle where FacturaID in(select FacturaID from @factura)

		select @valor = sum(cantidad * precio * (1 + isv))
		from @Factura f
		inner join @facturadetalle fd on f.FacturaID = fd.FacturaID
	
		return @valor
	end
go

select *, dbo.fTotalCliente(ClienteID)
from Cliente
