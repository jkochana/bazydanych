--1
begin transaction;
update production.product set ListPrice  = ListPrice *1.10 where ProductID = 680;
commit;

select production.product.ListPrice  from production.product where production.product.ProductID = 680;

--2
begin transaction;
delete from production.product where ProductID = 707;
rollback;

select *  from production.product where production.product.ProductID = 707;

--3
set IDENTITY_INSERT adventureworks2019.Production.Product ON;

begin transaction;
insert into production.product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, 
ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate) values 
(1003, 'af', 'fa', '6', '0', '10', '12', '0', '0', '0', getdate(), newid(), getdate());
commit;

select top 2 * from Production.Product order by ProductID desc; 

--4
begin transaction;
update Production.Product set StandardCost = StandardCost *1.1;
if (select sum(StandardCost) from Production.Product) < 5000 
	begin;
	commit;
	end;
else
	begin;
	rollback;
	end;

select sum(StandardCost) from Production.Product
select production.product.StandardCost  from production.product where production.product.ProductID = 680;

--5
begin transaction;
if exists (select * from Production.Product where ProductID = 1005)
	begin;
	rollback;
	end;
else
	begin;
	insert into production.product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, 
	ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate) values 
	(1005, 'asfs', 'fsaa', '6', '0', '10', '12', '0', '0', '0', getdate(), newid(), getdate());
	commit;
	end;

select top 2 * from Production.Product order by ProductID desc; 

--6
begin transaction;
update sales.SalesOrderDetail set OrderQty = OrderQty + 1;
if exists (select * from sales.SalesOrderDetail where OrderQty = 0)
	begin;
	rollback;
	end;
else
	begin;
	commit;
	end;

select OrderQty from sales.SalesOrderDetail;

--7
begin transaction;
delete from Production.Product where StandardCost > (select avg(StandardCost) from Production.Product);
if @@rowcount > 10
	begin;
	rollback;
	end;
else
	begin;
	commit;
	end;

select * from Production.Product where StandardCost > (select avg(StandardCost) from Production.Product);


