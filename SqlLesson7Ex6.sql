--�������� 4

use MyJoinsDB

--�������� 6

--������� �������/��������� ��� ����� �������:

--������� �������� ��� �������� ��� ����������� (������ ��������, ���� ����������).
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

--������� �������� ���������� ��� ���� ���������� ��� ����������� ����������� �� ������ �������� ��� ����������.
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
--������� �������� ���������� ��� ���� ���������� ��� ����������� � ������� ��������� �� ������ �������� ��� �����������.
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
