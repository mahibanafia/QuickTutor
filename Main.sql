create database TuitionPortal
use TuitionPortal

create table Contact(
ContactId int primary key identity(1,1) not null,
Name varchar(50),
Email varchar(100),
Subject varchar(100),
Message varchar(Max)
)

select * from Contact
DELETE FROM Contact
WHERE ContactId = 2


create table City(
CityId int primary key identity(1,1),
CityName varchar(50)
)

EXEC sp_rename 'City', 'Division';

Select * from division
EXEC sp_rename 'Division.CityId', 'DivisionId', 'COLUMN';
EXEC sp_rename 'Division.CityName', 'DivisionName', 'COLUMN';

insert into division values('Dhaka')
insert into division values('Barisal')
insert into division values('Khulna')
insert into division values('Chittagong')
insert into division values('Mymensingh')
insert into division values('Rajshahi')
insert into division values('Sylhet')
insert into division values('Rangpur')

Create table [User](
UserId int primary key identity(1,1),
Username varchar(50),
Password varchar(50),
Name varchar(50),
Email varchar(50),
Mobile varchar(50),
TenthGrade varchar (50),
TwelfthGrade varchar(50),
GraduationGrade varchar(50),
PostGraduationGrade varchar(50),
Phd varchar(50),
WorksOn varchar(50),
Experience varchar(50),
Resume varchar(50),
Address varchar(50),
Division varchar(50)
)

Alter table [User] add UNIQUE (Username)
select * from [User]

CREATE TABLE Tuition (
    TuitionId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NULL FOREIGN KEY REFERENCES [User](UserId),
    Title VARCHAR(50),
    Subject VARCHAR(200),
    NoOfStudent INT,
    Duration VARCHAR(50),
    PerWeek VARCHAR(20),
    Salary VARCHAR(50),
    TutoringMethod VARCHAR(50),
    Description VARCHAR(200),
    StuName VARCHAR(200),
    Division VARCHAR(50),
    Mobile VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(MAX)
);


Select * from Tuition

