--create table Carrera
--(
--	CarreraID	int not null,
--	Nombre		varchar(50) not null,
--	Director	varchar(50) not null,
--	constraint pkCarrera primary key (CarreraID)
--)

create or alter procedure spCarreraSelect 
as
	select * from Carrera 
go

create or alter procedure spCarreraInsert @carreraid int output, @nombre varchar(50), @director varchar(50)
as
	select @carreraid = max(CarreraID) + 1 from Carrera 
	insert into Carrera values(@carreraid, @nombre, @director)
go

create or alter procedure spCarreraUpdate @car int, @nom varchar(50), @dir varchar(50)
as
	update Carrera
	   set Nombre = @nom, Director = @dir
	 where CarreraID = @car
go

create or alter procedure spCarreraDelete @carreraid int
as
	delete from Carrera where carreraid = @carreraid
go

--create user db2 for login db2
--alter role db_owner add member db2

--select * from carrera
