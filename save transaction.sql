begin transaction 
	select * from Banco


	insert into Banco values(10, 'Banco 10')
	insert into Banco values(11, 'Banco 11')
	insert into Banco values(12, 'Banco 12')

	save transaction PuntoA

	insert into Banco values(13, 'Banco 13')
	insert into Banco values(14, 'Banco 14')

	rollback transaction PuntoA

	commit
	rollback

	select * from Banco
	delete from banco where BancoID > 9
