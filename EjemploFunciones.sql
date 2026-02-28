select b.BancoID, b.Nombre, ch.valor, d.valor
from Banco as b
left join dbo.fchequesBanco() ch on b.BancoID = ch.BancoID
left join dbo.fDepositosBanco() as d on d.BancoID = b.BancoID

select b.BancoID, b.Nombre, sum(ch.valor) as Cheques
from Banco as b
left join Cheque ch on b.BancoID = ch.BancoID
group by b.BancoID, b.Nombre

select b.BancoID, b.Nombre, sum(d.Valor) as Deposito
from Banco as b
left join Deposito as d on d.BancoID = b.BancoID
group by b.BancoID, b.Nombre

select *
from Articulo
-- mostar la ademas de las columnas de la tabla articulo y columna que contenga la cantidad de entadas (compras)
-- y una columna mostrando la cantidad de salidas (facturas)
