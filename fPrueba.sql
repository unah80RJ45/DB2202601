create or alter function dbo.fPrueba(@cliente int) returns float
as
	begin
		return 		
				(
					select sum(cantidad * precio * (1 + isv))
					from Factura f
					inner join facturadetalle fd on f.FacturaID = fd.FacturaID
					where ClienteID = @cliente
				)
	end
go

select *, dbo.fPrueba(ClienteID) 
from Cliente