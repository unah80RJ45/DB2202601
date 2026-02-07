create table ClienteTest
(
	ClienteID		int not null,
	Nombre			varchar(50) not null,
	Direccion		varchar(10) not null
)

create table FacturaTest
(
	FacturaID	int not null,
	ClienteID	int not null,
	Fecha		datetime
)

create table Detalle
(
	FacturaID	int not null,
	ArticuloID	int not null,
	Cantidad	int not null,
	Precio		float not null
)

create table Banco
(
	BancoID		int not null,
	Nombre		varchar(50) not null,
	Saldo		float
)

create table Deposito
(
	BancoID		int not null,
	DepositoID	int not null,
	Valor		float not null
)	