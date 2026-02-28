create or alter function dbo.fChequesBancos(@bco tBanco readonly) returns @cheques table(BancoID int, Valor float)
as
	begin
		insert into @cheques
		select BancoID, sum(Valor) from Cheque 
		where BancoID in(select BancoID from @bco)
		group by BancoID

		return
	end
go

create or alter procedure spPruebaCheques
as
	declare @bancos tBanco

	insert into @bancos values(2), (4)

	select * from dbo.fChequesBancos(@bancos)
go

exec spPruebaCheques