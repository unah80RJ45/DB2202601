create or alter procedure spFactura @cliente int = 0, @ciudad varchar(20) = ''
as
	select * into #cliente from Cliente where (ClienteID = @cliente or @cliente = 0) and (Direccion = @ciudad or @ciudad = '')
	select * into #factura from Factura where ClienteID in(select ClienteID from #cliente)
	select * into #facturadetalle from FacturaDetalle where FacturaID in(select FacturaID from #factura)
	select * into #articulo from Articulo where ArticuloID in(select ArticuloID from #facturadetalle)
	select * into #tipo from Tipo where TipoID in(select TipoID from #articulo)
	select * into #marca from Marca where MarcaID in(select MarcaID from #articulo)

	select f.FacturaID, f.ClienteID, c.Nombre, c.Direccion, fd.ArticuloID, a.Nombre as nomArticulo, fd.Cantidad, fd.Precio, fd.ISV, t.nombre as nomTipo, m.nombre as nomMarca
	from #factura as f
	inner join #facturadetalle fd on f.FacturaID = fd.FacturaID
	inner join #cliente as c on f.ClienteID = c.ClienteID
	inner join #articulo as a on fd.ArticuloID = a.ArticuloID
	left join #marca as m on a.MarcaID = m.MarcaID
	left join #tipo as t on a.TipoID = t.TipoID
go

grant execute on spFactura to public 

