select * FROM tbl_Persona
select * from tbl_Producto
select * from tbl_Venta

insert into tbl_Producto(nombreProducto, precioProducto, cedula)values('Enlatados',17.50,17)

-- 1.) CONSULTA:  Mostrar el nombre de la persona  y  el producto que dicha persona compro

select per.nombrePersona as NOMBRE, prod.nombreProducto as PRODUCTO_COMPRADO  from tbl_Persona per
inner join tbl_Producto prod on  per.Cedula = prod.cedula


--2.) CONSULTA:  Mostrar el nombre de las personas que compraron limonadas y hamburguesas

select pers.nombrePersona as NOMBRE, Prod.nombreProducto AS PRODUCTO_COMPRADO  from tbl_Persona pers 
inner join  tbl_Producto Prod on pers.Cedula =  Prod.cedula
where Prod.nombreProducto = 'Limonadas' OR Prod.nombreProducto = 'Hamburguesa'

--3.) CONSULTA: Mostrar la HORA y el Nombre de las personas que compraron HAMBURGUESAS

select V.hora_compra as HORA_DE_COMPRA, Pers.nombrePersona from tbl_Venta V  
inner join tbl_Producto Prod  on  V.Cedula_Persona = Prod.cedula
inner Join tbl_Persona Pers on Pers.Cedula = Prod.cedula
where Prod.nombreProducto = 'Hamburguesa' 

--4.) CONSULTA: Mostrar Los Nombres y los precios de los productos mayores de 15.90 y menores que 19.50

select  Prod.nombreProducto, precioProducto from tbl_Producto Prod where precioProducto < 19.50 and precioProducto > 15.90  

-- 5.) CONSULTA: Mostrar los NOMBRES de las PERSONAS Que compraron productos mayores de 15.90 y menores que 19.50
--               Mostra tambien los NOMBRES  de dichos productos
	  
select Pers.nombrePersona as COMPRADOR, Prod.nombreProducto as PRODUCTO_COMPRADO from tbl_Persona Pers inner join tbl_Producto Prod on Pers.Cedula =  Prod.cedula
where Prod.precioProducto >= 15.90 AND Prod.precioProducto <= 19.50

--6.) CONSULTA: Mostrar los NOMBRES, CEDULAS, PRODUCTO_COMPRADO  de las personas que compraron productos entre las 11:00 am y las 16 PM

select Pers.Cedula as CEDULA, Pers.nombrePersona AS PERSONA_QUE_COMPRO, Prod.nombreProducto AS PRODUCTO_COMPRADO, V.hora_compra AS HORAR_EN_QUE_COMPRO  from tbl_Persona Pers inner join tbl_Venta V on Pers.Cedula = V.Cedula_Persona
																								   inner join tbl_Producto Prod on V.Cedula_Persona = Prod.cedula 	where V.hora_compra <= '16:00:00' and V.hora_compra >= '11:00:00'


--7.)CONSULTA: MOSTRAR QUE  PRODUCTO  COMPRARON LOS QUE VIVEN EN LAURELES

select Pro.nombreProducto from tbl_Producto Pro inner join tbl_Persona Per on Pro.cedula =  Per.Cedula
where Per.direccionPersona = 'Laureles'

--8.)CONSULTA:  MOSTRAR  LOS NOMBRES Y  LAS EDADES  DE LAS  PERSONAS MAYORES  DE  18  AÑOS

select nombrePersona, edadPersona from tbl_Persona where edadPersona >= 18

--9) CONSULTA:  MOSTRAR  LOS PRODUCTOS  QUE COMPRARON  LAS  PERSONAS  MENORES  DE 18 AÑOS

select Per.edadPersona, Per.nombrePersona as MENOR_DE_18_AÑOS, Prod.nombreProducto AS PRODUCTO_QUE_COMPRO from tbl_Producto Prod inner join tbl_Persona Per on Per.Cedula = Prod.cedula
											where Per.edadPersona <= 18

--10.) CONSULTA: MOSTRAR  LAS EDADES  Y  LOS  PRODUCTOS  COMPRARON  LAS  PERSONAS QUE MAYORES  DE  18  AÑOS

select Per.edadPersona AS EDAD, Per.nombrePersona as MAYOR_DE_18_AÑOS, Prod.nombreProducto AS PRODUCTO_QUE_COMPRO from tbl_Producto Prod inner join tbl_Persona Per on Per.Cedula = Prod.cedula
											where Per.edadPersona >= 18
