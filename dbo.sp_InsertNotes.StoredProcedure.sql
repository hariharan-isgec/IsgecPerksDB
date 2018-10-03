USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertNotes]
@NotesHandle varchar(200),
@IndexValue varchar(200),
@Title varchar(Max),
@Description varchar(Max),
@User varchar(50),
@ReminderEmailId varchar(Max),
@ReminderDateTime varchar(50),
@SendEmailTo varchar(Max)
AS
BEGIN
DECLARE @NotesId varchar(200)
DECLARE @RunningId int
DECLARE @ReminderId int

SET @NotesId=(SELECT {fn CONCAT(CAST(Series as varchar),CAST(ISNULL(MAX(RunningNo),0) + 1  as varchar))}
as DocumentID FROM Note_DocumentSeries where Active='Y'
GROUP By Series )

SET @RunningId=(SELECT (ISNULL(MAX(RunningNo),0) + 1)as RunningNo FROM Note_DocumentSeries where Active='Y')

SET @ReminderId=(SELECT (ISNULL(MAX(ReminderId),0) + 1)as ReminderId FROM Note_Reminder)

If(select count(*) as HandleCount from Note_Handle Where NotesHandle=@NotesHandle)>0
BEGIN
INSERT INTO [IJTPerks].[dbo].[Note_Notes]
           ([Notes_RunningNo]
           ,[NotesId]
           ,[NotesHandle]
           ,[IndexValue]
           ,[Title]
           ,[Description]
           ,[UserId]
           ,[SendEmailTo]
           )
     VALUES
           (@RunningId
           ,@NotesId
           ,@NotesHandle
           ,@IndexValue
           ,@Title
           ,@Description
           ,@User
           ,@SendEmailTo
           )
           
  Update Note_DocumentSeries set RunningNo=@RunningId where Active='Y'
  
          IF @ReminderEmailId<>''
		  BEGIN
	  	  INSERT INTO [Note_Reminder]
				   ([ReminderID]
				   ,[NotesId]
				   ,[ReminderTo]
				   ,[ReminderDateTime]
				   ,[Status]
				   ,[User]
				   )
			 VALUES
				   (@ReminderId
				   ,@NotesId
				   ,@ReminderEmailId
				   ,@ReminderDateTime
				   ,'New'
				   ,@User
				   )
		    END
  
  SELECT @NotesId
  
  END
     
     ELSE
     Select 0   
END
GO
