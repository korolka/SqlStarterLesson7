--Завдання 4

use MyJoinsDB

--Завдання 6

--Створіть функції/процедури для таких завдань:

--Потрібно дізнатися про контактні дані співробітників (номери телефонів, місце проживання).
create function WorkerInf()
returns table
as
return(select PhoneNumber, City, Street, Building
		from Personal
		join PersonalOwnDetails 
		on Personal.PersonalId = PersonalOwnDetails.PersonalID
		join Adress 
		on PersonalOwnDetails.AdressId = Adress.AdressId);
go

select * from dbo.workerInf();

--Потрібно дізнатися інформацію про дату народження всіх неодружених співробітників та номери телефонів цих працівників.
create function NotMarriedInf(@IsMarried varchar(20))
returns table
as 
return (select PhoneNumber, BirthDate 
		from Personal
		join PersonalOwnDetails
		on Personal.PersonalId = PersonalOwnDetails.PersonalID
		join PersonalWorkDetails
		on Personal.PersonalId = PersonalWorkDetails.PersonalId
		where MartialStatus = @IsMarried)
go

declare @IsMarried varchar(20) = 'not married';
select * from dbo.NotMarriedInf(@IsMarried);
--Потрібно дізнатися інформацію про дату народження всіх співробітників з посадою менеджера та номери телефонів цих співробітників.
create function ManagerInf(@position varchar(20))
returns table
as 
return(select PhoneNumber, BirthDate 
		from Personal
		join PersonalOwnDetails
		on Personal.PersonalId = PersonalOwnDetails.PersonalID
		join PersonalWorkDetails
		on Personal.PersonalId = PersonalWorkDetails.PersonalId
		where PersonalWorkDetails.Position = @position)
go

select * from ManagerInf('manager')
