USE [patika]
GO

/****** Object:  Trigger [dbo].[update_grade]    Script Date: 30.01.2022 22:00:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[update_grade]
on [dbo].[Attendance]
AFTER INSERT 
AS
BEGIN
	declare @studentId int
	declare @courseId int
	declare @week int
	SELECT @studentId = StudentId, @courseId = CourseId, @week = Week from inserted

	Update dbo.Grade
	Set Grade = (@week/7)*100
	Where StudentId = @studentId and CourseId = @courseId

END
GO

ALTER TABLE [dbo].[Attendance] ENABLE TRIGGER [update_grade]
GO

