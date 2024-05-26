
select employee.nationalidnumber, employee.loginid, employeepayhistory.rate as stawka_godzinowa 
into TempEmployeeInfo from employeepayhistory inner join employee 
on employeepayhistory.businessentityid = employee.businessentityid;


with zad2 as ( select concat( sales.store.name,' (',person.person.firstname,' ',person.person.lastname,')')
as CompanyContact, sales.salesorderheader.subtotal as Revenue from sales.salesorderheader inner join sales.customer on
sales.salesorderheader.customerid = sales.customer.customerid inner join sales.store on 
sales.customer.storeid = sales.store.businessentityid inner join person.person 
on sales.store.businessentityid = person.person.businessentityid group by CompanyContact, Revenue )

select CompanyContact, Revenue from zad2;

