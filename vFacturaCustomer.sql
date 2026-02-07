select * from FacturaTest
select * from customer

create or alter view vFacturaCustomer
as
	select f.FacturaID, f.ClienteID, c.CustomerID, c.Nombre, c.DIreccion
	from FacturaTest f
	inner join Customer c on f.ClienteID = c.CustomerID
go

alter table FacturaTest add Tipo varchar
alter table FacturaTest add Estado varchar

create table Customer
(
	CustomerID	int not null,
	Nombre		varchar(50),
	Direccion	varchar(50)
)

insert into Customer
select * from ClienteTest

select *
from vFacturaCustomer

update