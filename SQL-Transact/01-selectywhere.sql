use NORTHWND;

-- Seleccionar todos los clientes
select * from Customers;
GO
-- Seleccionar todas las ordenes mostrando
-- solamente fecha de la orden, el cliente que soli-
--cito, el empleado que la realizo
select OrderDate, CustomerID, EmployeeID 
from Orders;
go

-- Seleccionar todas las ordenes mostrando
-- solamente fecha de la orden, el cliente que soli-
--cito, el empleado que la realizo, pero poniendo
-- nombres personalizados a los campos (Alias de Columna)

select OrderDate  AS [Fecha Orden], 
CustomerID clave_cliente, 
EmployeeID as [Clave Empleado] 
from Orders;

-- Seleccionar todos los productos que 
-- tengan un precio igual a 18
select ProductID as [Numero Producto], 
ProductName as [Nombre Producto], 
UnitPrice as [Precio Unitario] 
from Products
where UnitPrice = 18;

-- Operadores Relacionales
-- =, <, >, <=, >=, <> o !=

select * from Products
where UnitsInStock > 20

select * from Products
where UnitsInStock >= 20

select * from Products
where UnitsInStock < 20

-- Seleccionen todas las ordenes que tengan una 
-- fecha de orden menor a diciembre de 1996
select OrderID, OrderDate, CustomerID 
from Orders
where OrderDate < '1996-12-31'
GO

select OrderID as [Numero Orden], 
OrderDate as [Fecha Orden],
year(orderDate) as [Año],
datepart(year, orderDate) as 'Año',
datepart(quarter, orderDate) as 'Trimestre',
datepart(mm, orderDate) as 'Mes',
datename(month, orderDate) as 'Nombre Mes',
CustomerID as [Clave Cliente]
from Orders
where OrderDate < '1996-12-31';


select OrderID as [Numero Orden], 
OrderDate as [Fecha Orden],
year(orderDate) as [Año],
datepart(year, orderDate) as 'Año',
datepart(quarter, orderDate) as 'Trimestre',
datepart(mm, orderDate) as 'Mes',
datename(month, orderDate) as 'Nombre Mes',
CustomerID as [Clave Cliente]
from Orders
where OrderDate > '1996-12-31';

-- Seleccionar todas las ordenes de 1997
select OrderID as [Numero Orden], 
OrderDate as [Fecha Orden],
year(orderDate) as [Año],
datepart(year, orderDate) as 'Año',
datepart(quarter, orderDate) as 'Trimestre',
datepart(mm, orderDate) as 'Mes',
datename(month, orderDate) as 'Nombre Mes',
CustomerID as [Clave Cliente]
from Orders 
where year(orderDate) = 1997;
GO

select OrderID as [Numero Orden], 
OrderDate as [Fecha Orden],
year(orderDate) as [Año],
datepart(year, orderDate) as 'Año',
datepart(quarter, orderDate) as 'Trimestre',
datepart(mm, orderDate) as 'Mes',
datename(month, orderDate) as 'Nombre Mes',
CustomerID as [Clave Cliente]
from Orders 
where datepart(yyyy,orderDate) = 1997;

-- Operadores Lógicos
-- and, or, not, between, in

-- seleccionar nombre del producto, cantidad,
-- precio pero solamente los que tengan un precio 
-- entre 20 y 80

select ProductName as [Nombre Producto],
UnitPrice as [precio], 
UnitsInStock as [Cantidad]
from Products
where UnitPrice>=20 and UnitPrice<=80;

select ProductName as [Nombre Producto],
UnitPrice as [precio], 
UnitsInStock as [Cantidad]
from Products
where UnitPrice>=20 or UnitPrice<=80;

select ProductName as [Nombre Producto],
UnitPrice as [precio], 
UnitsInStock as [Cantidad]
from Products
where UnitsInStock=20 or UnitsInStock=80;


-- seleccionen todos clientes que sean de 
-- alemania y estados unidos
select * from Customers
where Country = 'Germany' 
      or country='USA';

-- Seleciona las ordenes que se le vendieron 
-- a los clientes Frankenversand  y
-- Great Lakes Food Market, mostrando el año,
-- mes, fecha completa
select Datepart(year, OrderDate) as 'Año',
datepart(month, OrderDate) as 'Mes', 
OrderDate as 'Fecha', ShipName
from orders
where CustomerID = 'FRANK' or 
CustomerID = 'GREAL';

-- a todos aquellos que no sean 
-- Frankenversand  y
-- Great Lakes Food Market

select Datepart(year, OrderDate) as 'Año',
datepart(month, OrderDate) as 'Mes', 
OrderDate as 'Fecha', ShipName
from orders
where not (CustomerID = 'FRANK' or 
CustomerID = 'GREAL');

Select * from employees

-- Seleccionar todos los empleados
-- de londres y seatle 
-- Mostrando el nombre completo del empleado, 
-- la ciudad y el pais 

select 
concat(FirstName, ' ', LastName) as [fullname], 
country as [pais], city as [ciudad]
from Employees
where city in('seattle', 'london');

select 
(FirstName +  ' ' + LastName) as [fullname], 
country as [pais], city as [ciudad]
from Employees
where city in('seattle', 'london');

select 
concat(FirstName, ' ', LastName) as [fullname], 
country as [pais], 
city as [ciudad] 
from Employees
where city  = 'seatle' or city='london';

--seleccionar todos los productos donde su
-- precio uniario este entre 30 y 100 dolares

select ProductName as [Nombre Producto],
UnitPrice as [Precio Producto], 
UnitsInStock as [Cantidad]
from Products
where UnitPrice>=30 and UnitPrice<=100;

-- Instrucción between
select ProductName as [Nombre Producto],
UnitPrice as [Precio Producto], 
UnitsInStock as [Cantidad]
from Products
where UnitPrice between 30 and 100;

--seleccionar todos los productos donde su
-- precio uniario no este entre 30 y 100 dolares

select ProductName as [Nombre Producto],
UnitPrice as [Precio Producto], 
UnitsInStock as [Cantidad]
from products
where not(UnitPrice>=30 and UnitPrice<=100);

select ProductName as [Nombre Producto],
UnitPrice as [Precio Producto], 
UnitsInStock as [Cantidad]
from products
where UnitPrice<30 or UnitPrice>100;

select ProductName as [Nombre Producto],
UnitPrice as [Precio Producto], 
UnitsInStock as [Cantidad]
from products
where UnitPrice not between 30 and 100;

-- Seleccionar todas las ordenes enviadas 
-- a Alemania, Francia, suiza y brazil
select * from 
orders
where ShipCountry 
in ('Switzerland', 'France', 'Brazil', 'germany')
-- Campos calculados

-- seleccionar el subtotal de las ordenes, 
-- Mostrando el producto, la cantidad vendida 
-- y el precio 

select ProductID as [Producto], 
Quantity as [Cantidad], 
UnitPrice as [Precio], 
(Quantity * UnitPrice) as [Subtotal]
from [Order Details]
-- Seleccionar el costo del inventario de
-- cada producto, mostrando el nombre del 
-- producto, precio unitario y stock

-- Joins (inner, left, rigth, full)
-- Seleccionar todos los productos con su categoria
-- Mostrando el nombre del producto y el
-- nombre de la categoria

-- Alias de tabla 

select pr.ProductID as [Numero Producto], 
pr.ProductName as [Nombre del Producto], 
ca.CategoryID as [Numero de Categoria],
ca.CategoryName as [Nombre de Categoria]
from  products as pr
inner join Categories as ca
on ca.CategoryID = pr.CategoryID;
GO

-- Seleccionar todos los productos 
-- mostrando el nombre del producto, 
-- y Nombre del proveedor (supplier)

select pr.ProductName as [Nombre del Producto],
s.CompanyName as [Nombre del Proveedor]
from 
Products as pr 
inner join 
suppliers as s
on pr.SupplierID = s.SupplierID;
go

-- Seleccionar los nombres de los productos
-- que han sido ordenados y sus subtotales


-- Seleccionar los nombres de los productos vendidos, 
-- el nombre de su categoria, el precio que se vendio, 
-- la cantidad vendida y su subtotal
select p.ProductName as [Nombre del Producto],
ca.CategoryName as [Nombre Categoria], 
od.UnitPrice as [Precio de Venta], 
od.Quantity as [Cantidad Vendida], 
(od.Quantity * od.UnitPrice) as [Subtotal]
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
inner join Categories as ca
on ca.CategoryID = p.ProductID;
go


-- seleccionar los nombres de los productos vendidos, 
-- nombre de su categoria, el nombre completo del 
-- empleado que realzo la orden, la fecha de venta
-- el precio de venta, cantidad y subtotal.

select p.ProductName as [Nombre del Producto], 
ca.CategoryName as [Nombre de la Categoria], 
concat(emp.FirstName, '-', emp.LastName) as [Nombre Completo],
o.OrderDate as [Fecha de Venta], od.UnitPrice as [Precio de Venta],
od.Quantity as [Cantidad Vendida], 
(od.UnitPrice * od.Quantity) as [Sutotal]
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID
inner join categories as ca
on p.CategoryID = ca.CategoryID
inner join Employees as emp
on emp.EmployeeID = o.EmployeeID;
GO

-- seleccionar los nombres de los productos vendidos, 
-- nombre de su categoria, el nombre completo del 
-- empleado que realzo la orden, la fecha de venta
-- el precio de venta, cantidad y subtotal, para las
-- categorias Beverages,Condiments y seafood

select p.ProductName as [Nombre del Producto], 
ca.CategoryName as [Nombre de la Categoria], 
concat(emp.FirstName, '-', emp.LastName) as [Nombre Completo],
o.OrderDate as [Fecha de Venta], od.UnitPrice as [Precio de Venta],
od.Quantity as [Cantidad Vendida], 
(od.UnitPrice * od.Quantity) as [Sutotal]
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID
inner join categories as ca
on p.CategoryID = ca.CategoryID
inner join Employees as emp
on emp.EmployeeID = o.EmployeeID
where ca.CategoryName in ('Beverages', 'Condiments','seafood');
GO


-- Crear base de datos
create database stagenorthwind;
go

use stagenorthwind;
GO

if not exists (select 1 from sys.tables where name ='ProductsStage')
BEGIN 
    CREATE TABLE ProductsStage(
	   productoid int not null identity(1,1),
	   Nombreproducto nvarchar(40) not null,
	   precioUnitario money not null, 
	   stock smallint not null, 
	   categoriaid int not null, 
	   constraint pk_ProductsStage
	   primary key(productoid)
	)
END;
go

-- Crear una tabla a partir de una consulta

select top 0 CategoryID as [Categoriaid], CategoryName as [Nombrecategoria]
into stagenorthwind.dbo.categoriesstage
from NORTHWND.dbo.Categories;

alter table categoriesstage
alter column [Categoriaid] int not null;
go

alter table categoriesstage
add constraint pk_catgoriesstage
primary key (Categoriaid); 
go

alter table stagenorthwind.dbo.productsStage
add constraint fk_productstage_categoriasstage
foreign key(categoriaid)
references categoriesstage(Categoriaid);
GO

-- Consultar categories de northwind e insertamos en 
-- categoriesstage de la bd stagenorthwind
use stagenorthwind
go

create or alter procedure spu_cargaCategorias
as
begin

insert into stagenorthwind.dbo.categoriesstage 
(Nombrecategoria)
select categoryName 
from NORTHWND.dbo.Categories;

end;
go

-- Ejecutar un store  procedure
execute spu_cargaCategorias;
GO

-- Eliminar un Store Procedure
drop procedure cargaCategorias;
go

select * from stagenorthwind.dbo.categoriesstage 

-- LLenar la tabla de productsstage a partir 
-- de la tabla products de northwind

insert into stagenorthwind.dbo.ProductsStage (Nombreproducto,
precioUnitario, stock, categoriaid)
select p.ProductName, p.UnitPrice, 
p.UnitsInStock, ca.CategoryID 
from NORTHWND.dbo.Categories as ca
inner join NORTHWND.dbo.Products as p
on ca.CategoryID = p.CategoryID;

-- Left Join 

use stagenorthwind;

select * from categoriesstage

select * from ProductsStage

select * from 
categoriesstage as ce
inner join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;

select * from 
categoriesstage as ce
left join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid

insert into categoriesstage (Nombrecategoria)
values('Drinks')

insert into ProductsStage 
(Nombreproducto, precioUnitario, stock, categoriaid)
values ('Michelada TL', 6.5, 345,9);


-- RIGHT JOIN
insert into ProductsStage
(Nombreproducto, precioUnitario, stock, categoriaid)
values ('Refrigerador', 45000, 34,null);

select * from ProductsStage

select * from 
categoriesstage as ce
inner join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;

select * from 
categoriesstage as ce
Right join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid


-- FULL JOIN

insert into categoriesstage (Nombrecategoria)
values('VIP');

select * from 
categoriesstage as ce
inner join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;

select * from 
categoriesstage as ce
left join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;

select * from 
categoriesstage as ce
right join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;


select * from 
categoriesstage as ce
full join ProductsStage as ps
on ce.Categoriaid = ps.categoriaid;
       






