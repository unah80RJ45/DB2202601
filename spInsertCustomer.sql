create or alter procedure spInsertCustomer @name varchar(50) = 'SinNombre', @dir varchar(50)
as
	declare @nuevo int, @ultimo as int, @tipo varchar

	select @ultimo = max(CustomerID) from Customer
	select @nuevo = @ultimo + 1, @tipo = 'I'

	insert into Customer values(@id, @name, @dir)

	exec spInsertAuditoria @id, @tipo

	select * from Customer where CustomerID = @id
	select * from Auditoria where CustomerID = @id
go

exec spInsertCustomer 'Johan', 'CEI'

create table Auditoria
(
	CustomerID	int not null,
	Accion		varchar(1) not null,
	Fecha		datetime
)

create or alter procedure spInsertAuditoria @customerid int, @accion varchar
as
	insert into Auditoria values(@customerid, @accion, getdate())
go

exec spInsertAuditoria 1, 'I'

select * from Auditoria
