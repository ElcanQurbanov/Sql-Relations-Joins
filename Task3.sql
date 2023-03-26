CREATE TABLE Countries(
	[Id] int primary key identity (1,1),
	[Name] nvarchar (50) not null
	)


	insert into Countries ([Name])

	values ('Azerbaycan'),
	       ('Turkey')

	select * from Countries



	CREATE TABLE Cities(
	[Id] int primary key identity (1,1),
	[Name] nvarchar (50) not null,
	[CountryId] int foreign key references Countries(Id)
	)

	

	insert into Cities ([Name], [CountryId])

	values ('Baki', 1),
		   ('Xirdalan', 1),
		   ('Istanbul', 2)

		  


	select * from Cities

	
	
	CREATE TABLE Employees(
	[Id] int primary key identity (1,1),
	[Name] nvarchar (50) not null,
	[Surname] nvarchar (60),
	[Age] int,
	[Salary] decimal,
	[Position] nvarchar(70),
	[IsDeledet] bit not null default 0,
	[CityId]  int foreign key references Cities(Id)
	)


	insert into Employees ([Name], [Surname], [Age], [Salary], [Position], [IsDeledet], [CityId])

	values ('Aqsin', 'Hummetov', 27, 2700, 'SuperAdmin', 1,1),
		   ('Saiq', 'Kazimov', 25, 2500, 'Admin',1,1),
		   ('Cavid', 'Besirov', 29, 6900, 'Director', 1,2),
		   ('Cavid', 'Ismayilzade', 22, 2200, 'Reseption', 1,1)


	select * from Employees


	select em.Name, em.Surname, ct.name,
	co.Name from Employees em

	inner join Cities ct
	on em.CityId= ct.Id

	inner join Countries co
	on co.Id = ct.CountryId




	select em.Name, co.Name from Employees em

	inner join Cities ct
	on em.CityId = ct.Id

	inner join Countries co
	on co.Id = ct.countryId
	where em.Salary > 2000




	select ct.Name, co.Name from Cities ct

	inner join Countries co

	on ct.CountryId = co.Id




	select em.Name, em.Surname, em.Age, em.Salary,
	em.Position, ct.Name, co.Name, em.Isdeledet from Employees em

	inner join Cities ct
	on em.CityId = ct.Id

	inner join Countries co
	on co.Id = ct.CountryId
	where em.Position = 'reseption'




	select em.Name, em.Surname, ct.Name,
	co.Name, em.Isdeledet from Employees em

	inner join Cities ct
	on em.CityId = ct.Id

	inner join Countries co
	on co.Id = CountryId
	where em.IsDeledet = 'True'

	


