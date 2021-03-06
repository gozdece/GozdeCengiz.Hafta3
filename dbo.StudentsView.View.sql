USE [patika]
GO
/****** Object:  View [dbo].[StudentsView]    Script Date: 30.01.2022 22:03:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[StudentsView]
as
select stu.Name as student,co.Name as course from Student as stu
	inner join Participant par
	on stu.StudentId = par.StudentId
	inner join Course as co
	on par.CourseId = co.CourseId

group by stu.Name,co.Name
GO
