create or alter procedure spFacturaClienteUpdate @cliente int
as
	declare @factura int, @contador int = 1

	declare crsFactura cursor scroll for 
	select FacturaID from Factura where ClienteID = @cliente

	open crsFactura
	fetch last from crsFactura into @factura

	while @@FETCH_STATUS = 0
		begin
			update Factura set Total = @contador where FacturaID = @factura
			select @contador = @contador + 1

			fetch prior from crsFactura into @factura
		end

	deallocate crsFactura 
go

exec spFacturaClienteUpdate 34

select * from Factura where ClienteID = 34

--update Factura set total = null

