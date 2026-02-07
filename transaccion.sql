begin transaction
	create table PruebaLote (LoteID int, Valor float, constraint pkLote primary key (LoteID))
	go
	drop default dftCero
	go
	create default dftCero as 0
	go
	insert into PruebaLote values(1, 1000)
	insert into PruebaLote values(2, 2000)
	insert into PruebaLote Values(3, 3000)

	if @@ERROR = 0
		begin
			commit;
			select * from PruebaLote
		end
	else
		begin
			rollback;
			print 'no se ejecuto nada'
		end

		--select * from PruebaLote 
-- drop table PruebaLote
