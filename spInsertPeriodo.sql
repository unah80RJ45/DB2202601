create table Periodo
(
	Ano		int not null,
	Mes		int not null,
	Estado	varchar(1) not null, constraint pkPeriodo primary key (Ano, Mes)
)
create or alter procedure spInsertPeriodo @ano int
as
	declare @mes int = 1
	while @mes < 12
		begin
			if not exists (select * from Periodo where Ano = @ano and mes = @mes)
				begin
					insert into Periodo values(@ano, @mes, 'A'); exec spInsertAuditoria @ano, 'I'
				end
			else
				print concat('El mes ', @ano, ' - ', @mes, ' ya existe')	
			select @mes = @mes + 1
		end
go

