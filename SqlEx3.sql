--�������� 3

--������� �������� ��� ����� �������:
use MyJoinsDB

select * from PersonalInformation
select * from StatusAndBirth
select * from Position
select * from adress

--drop view PosBirthAndNumber

--��������� �������� �������� ��� ����������� (������ ��������, ���� ����������).
create view PersonalInformation
as select [Name],PhoneNumber, city, Street,Building
from personal
join PersonalOwnDetails
on personal.PersonalId = PersonalOwnDetails.PersonalID
join Adress
on PersonalOwnDetails.AdressId = Adress.AdressId
go 

select * from PersonalInformation

--��������� �������� ���������� ��� ���� ���������� ��� ����������� ����������� �� ������ �������� ��� ����������.

create view NotMarriedWithPhone
as select [Name], PhoneNumber, BirthDate,MartialStatus
from personal
join 
PersonalOwnDetails 
on Personal.PersonalId = PersonalOwnDetails.PersonalID
where MartialStatus = 'not married'
go

select * from NotMarriedWithPhone

--��������� �������� ���������� ��� ���� ���������� ��� ����������� � ������� ��������� �� ������ �������� ��� �����������.

create view PosBirthAndNumber
as select [Name], PhoneNumber,BirthDate,Position
from Personal
join PersonalOwnDetails
on Personal.PersonalId = PersonalOwnDetails.PersonalID
join PersonalWorkDetails
on Personal.PersonalId = PersonalWorkDetails.PersonalId
where Position = 'manager'
go

select * from PosBirthAndNumber