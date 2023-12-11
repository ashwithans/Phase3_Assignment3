create database ExerciseDb3

use ExerciseDb3

drop table Products

create table Products
(PId int primary key identity(1,1),
PQ int,
PPrice float,
DiscountedPrice float,
ManufacturingDate date)

insert into Products(PQ,PPrice,DiscountedPrice,ManufacturingDate) values
(10, 50.55, 10.35, '2022-01-15'),
(8, 75.55, 15.35, '2022-03-20'),
(15, 150.55, 20.35, '2022-05-10'),
(5, 40.55, 8.35, '2022-07-05'),
(12, 90.55, 18.35, '2022-09-12');
select * from Products

create function CalDiscountedValue(@price float, @discount float)
returns float
as
begin
declare @discountedvalue float
set @discountedvalue = @price - (@price * @discount/100)
return @discountedvalue
end


select 
PId as PID,
PPrice as Price,
DiscountedPrice as Discount,
dbo.CalDiscountedValue(PPrice, DiscountedPrice) as PriceAfterDiscount
from Products