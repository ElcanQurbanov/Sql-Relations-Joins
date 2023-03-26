CREATE TABLE Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null
)

insert into Countries([Name])
values('Argentina')

select * from Countries



CREATE TABLE Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries(Id)
)

insert into Cities([Name], [CountryId])
values ( 'Baku', 1),
       ( 'Sumqayit', 1),
	   ( 'Xirdalan', 1),
	   ( 'Gence', 1),
	   ( 'Goranboy', 1),
	   ( 'Tbilisi', 2),
	   ( 'Batumi', 2),
	   ( 'Istanbul', 3),
	   ( 'Izmir', 3),
	   ( 'Ankara', 3),
	   ( 'New York', 4),
	   ( 'San Francisco', 4),
	   ( 'Mentoza', 5),
	   ( 'Salta', 5)


	   select * from Cities




	   CREATE TABLE Students(
	   [Id] int primary key identity(1,1),
       [Name] nvarchar(50) not null,
	   [Surname] nvarchar (70),
	   [Age] int,
	   [Address] nvarchar(80),
	   [CityId] int foreign key references Cities(Id)
	   )

	   insert into Students([Name], [Surname], [Age], [Address], [CityId])
	   values ('Aksin', 'Hummetov', 27, 'Xirdalan', 1),
	          ('Cavid', 'Besirov', 29, 'Ehmedli', 1),
	          ('Saiq', 'Kazimov', 25, 'Sedmoy', 1),
			  ('Cavid', 'Ismayilzade', 22, 'Sulutepe', 1),
			  ('Elcan', 'Qurbanov', 20, 'Ehmedli', 1)


	   select * from Students




	   CREATE TABLE Seanses(
	   [Id] int primary key identity(1,1),
	   [Name] nvarchar(50) not null
	   )

	   insert into Seanses([Name])
	          values('Dawn'),
			        ('Afternoon'),
			        ('Evening')

	   select * from Seanses



	   CREATE TABLE WeekDays(
	   [Id] int primary key identity(1,1),
	   [Name] nvarchar(50) not null
	   )

	   insert into WeekDays([Name])

	               values('Monday'),
				         ('Tuesday'),
				         ('Wednesday'),
				         ('Thursday'),
				         ('Friday'),
				         ('Saturday'),
						 ('Sunday')

						 select * from WeekDays



	   
	CREATE TABLE WeekDaySeans(
	[Id] int primary key identity (1,1),
	[WeekDayId] int foreign key references WeekDays (Id),
	[SeansId] int foreign key references Seanses (Id)
	)

	insert into WeekDaySeans([WeekDayId], [SeansId])

	                 values (1,1),
					        (2,1),
					        (3,1),
					        (4,1),
							(5,1)

							select * from WeekDaySeans





	CREATE TABLE Educations(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50) not null,
	[Duration] int 
	)
	
	insert into Educations([Name], [Duration])
	            values ('Full Stack Developer', 6),
			           ('UI/UX Designer', 6),
			    	   ('Graphic Designer', 6),
				       ('3D Digital Design', 6),
					   ('Digital Marketing', 6)

					   select * from Educations





     create table Rooms(
     [Id] int primary key identity(1,1),
     [Name] nvarchar (50) not null,
     [Capacity] int
     )


     insert into Rooms([Name],[Capacity])

     values('Saturn',20),
     ('Neptune',25),
     ('Venus',20),
     ('Uranus',20),
	 ('Mars',18),
     ('Jupiter',22)

	 select * from Rooms




	 CREATE TABLE Teachers(
	 [Id] int primary key identity(1,1),
	 [Name] nvarchar(50) not null,
	 [Surname] nvarchar(60),
	 [Email] nvarchar(80) unique,
	 [Address] nvarchar(90),
	 [Salary] decimal,
	 [CityId] int foreign key references Cities(Id)
	 )


	

     insert into Teachers ([Name], [Surname], [Email], [Address], [Salary], [CityId])
     values  ('Aqsin', 'Hummetov', 'aqsin@code.edu.az', 'Xirdalan', 7000, 1),
             ('Elcan', 'Qurbanov', 'elcan@code.edu.az', 'Ehmedli', 5500, 1),
             ('Saiq', 'Kazimov', 'saiq@code.edu.az', 'Sedmoy', 3500, 1),
             ('Cavid', 'Ismayilzade', 'cavid@code.edu.az', 'Sulutepe', 2500, 1),
             ('Samir', 'Besirov', 'cavidb@code.edu.az', 'Ehmedli', 7000, 1)

	 select * from Teachers



	 CREATE TABLE Groups(
	 [Id] int primary key identity(1,1),
	 [Name] nvarchar(50) not null,
	 [EducationId] int foreign key references Educations (Id),
	 [RoomId] int foreign key references Rooms (Id),
	 [WeekDaySeansId] int foreign key references WeekDaySeans (Id),
	 )

	 insert into Groups ([Name], [EducationId], [RoomId], [WeekDaySeansId])

	       values ('P135', 1,2,1),
		          ('P130', 1,2,1),
				  ('P414', 1,2,1),
				  ('P212', 1,2,1)

				  select * from Groups



     CREATE TABLE GroupTeachers(
	 [Id] int primary key identity(1,1),
	 [GroupId] int foreign key references Groups (Id),
	 [TeacherId] int foreign key references Teachers (Id)
	 )

	 insert into GroupTeachers([GroupId], [TeacherId])
	        values (1,2),
			       (2,1)

				   select * from GroupTeachers

				 



     CREATE TABLE GroupStudents(
	 [Id] int primary key identity(1,1),
	 [GroupId] int foreign key references Groups (Id),
	 [StudentId] int foreign key references Students (Id)
	 )

	 insert into GroupStudents([GroupId], [StudentId])
	 values (1,1),
            (1,2),
			(1,3),
			(1,4),
			(1,5)

	 select * from GroupStudents


	 CREATE TABLE Roles(
	 [Id] int primary key identity(1,1),
	 [Name] nvarchar(50) not null
	 )

	 insert into Roles ([Name])
	 values ('Director'),
	        ('Senior management'),
			('Middle management'),
			('Supervisors')

			select * from Roles




     CREATE TABLE StaffMembers(
	 [Id] int primary key identity(1,1),
	 [Name] nvarchar(50) not null,
	 [Surname] nvarchar(60),
	 [Salary] decimal,
	 [CityId] int foreign key references Cities (Id)
	 )

	 insert into StaffMembers ([Name], [Surname], [Salary], [CityId])
	 values ('Aqsin', 'Hummetov', 4400, 1),
	        ('Saiq', 'Kazimov', 3300, 1),
			('Cavid', 'Ismayilzade', 2200, 1),
			('Cavid', 'Besirov',6600, 1)

	 select * from StaffMembers



	 CREATE TABLE RoleMembers(
	 [Id] int primary key identity(1,1),
	 [RoleId] int foreign key references Roles (Id),
	 [MemberId] int foreign key references StaffMembers (Id)
	 )

	 insert into RoleMembers ([RoleId], [MemberId])
	 values (1, 1),
	        (3, 2),
			(3, 3),
			(2, 4)

			select * from RoleMembers