create or alter function dbo.fChequesBanco() returns @cheques table(BancoID int, Valor float)
as
	begin
		insert into @cheques
		select BancoID, sum(Valor) from Cheque group by BancoID

		return
	end
go
create or alter function dbo.fDepositosBanco() returns @depositos table(BancoID int, Valor float)
as
	begin
		insert into @depositos
		select BancoID, sum(Valor) from Deposito group by BancoID

		return
	end
go
