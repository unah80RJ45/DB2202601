create or alter function dbo.fAmortizaPrestamo(@capital float, @tasa float, @tiempo int) returns 
@amortiza table (Cuota int, Capital float, Interes float, Abono float)
as
	begin
		declare @cuota int = 0, @abono float = @capital / @tiempo, @interes float

		while @cuota < @tiempo
			begin
				select @cuota = @cuota + 1, @interes = @capital * @tasa / 12, @capital = @capital - @abono
				insert into @amortiza (Cuota, Capital, Interes, Abono)
				values (@cuota, @capital + @abono , @interes, @abono)
			end

		return
	end
go

select * 
from dbo.fAmortizaPrestamo(50000, 0.15, 12) 