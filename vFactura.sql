--insert into ClienteTest values(1, 'Juan', 'SPS'), (2, 'Pedro', 'PRO')
--insert into FacturaTest values(1, 1, '2026-01-01'), (2, 2, '2026-01-01')
--insert into Detalle values(1, 1, 10, 20), (1, 2, 15, 30), (2, 1, 10, 20), (2, 4, 20, 15)


create or alter view vFactura
as
	select ft.FacturaID, ft.ClienteID, ct.Nombre, ft.Fecha, sum(cantidad * precio) as Total 
	from FacturaTest ft
	inner join ClienteTest ct on ft.ClienteID = ct.ClienteID
	inner join Detalle d on ft.FacturaID = d.FacturaID
	group by ft.FacturaID, ft.ClienteID, ct.Nombre, ft.Fecha
	order by ct.Nombre
go

select *
from vFactura
order by Nombre


insert into Detalle values(2, 5, 10, 10)
insert into Detalle values(3, 3, 'Miguel', '2026-01-31', 700)

