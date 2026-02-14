create table Producto
(
	ProductoID		int not null,
	Nombre			varchar(50) not null,
	Existencia		int not null,
	constraint chkExistencia check (Existencia >= 0)
)

create table Ajuste
(
	AjusteID	int not null,
	Tipo		varchar(1) not null,
	ProductoID	int not null,
	Cantidad	int not null
)
alter table Ajuste add Descripcion varchar(100)

insert into Producto values(1, 'Computadora Desktop', 0), (2, 'Computadora Portatil', 0), (3, 'Impresora Matricial', 0), (4, 'Impresora Laser', 0)

select * from Producto
select * from Ajuste