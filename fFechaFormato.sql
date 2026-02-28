create or alter function dbo.fFechaFormato (@fecha datetime) returns  varchar(50)
as
	begin
		declare @formato varchar(50)
		declare @mes varchar(20)

		select @mes = case month(@fecha)
						when 1 then 'Enero' when 2 then 'Febrero' when 3 then 'Marzo' when 4 then 'Abril'
						when 5 then 'Mayo' when 6 then 'Junio' when 7 then 'Julio' when 8 then 'Agosto'
						when 9 then 'Septiembre' when 10 then 'Octubre' when 11 then 'Novimiembre' else 'Dicembre'
					end

		select @formato = concat(day(@fecha), ' de ', @mes, ' de ', year(@fecha))

		return @formato
	end
go

select *, dbo.fFechaFormato(Fecha)
from Cheque

-- hacer una funcio que reciba como parametro el ano y el es y me devuelva el ultimo dia de mes
