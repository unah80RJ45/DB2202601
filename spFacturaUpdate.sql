create or alter procedure spFacturaUpdate @factura int
as
	declare @total as float
	
	select @total = sum(Cantidad * Precio * (1 + isv)) from FacturaDetalle where FacturaID = @factura

	update Factura 
	   set Total = @total
	 where FacturaID = @factura
go

exec spFacturaUpdate 22901

select * from Factura
