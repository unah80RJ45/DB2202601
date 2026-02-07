
create or alter view vFactura
as
	select f.FacturaID, f.ClienteID, c.Nombre, a.Nombre as nomArticulo, fd.Cantidad, fd.Precio, fd.Cantidad * fd.Precio * fd.ISV as Impuesto, t.nombre as nomTipo, m.nombre as nomMarca
	from Factura as f
	inner join FacturaDetalle fd on f.FacturaID = fd.FacturaID
	inner join Cliente as c on f.ClienteID = c.ClienteID
	inner join Articulo as a on fd.ArticuloID = a.ArticuloID
	left join Marca as m on a.MarcaID = m.MarcaID
	left join Tipo as t on a.TipoID = t.TipoID
go

select * 
from vFactura
where ClienteID = 34


