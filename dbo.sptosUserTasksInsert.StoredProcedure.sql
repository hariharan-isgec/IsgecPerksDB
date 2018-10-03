USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksInsert]
  @UserID NVarChar(8),
  @TaskID Int,
  @TaskTypeID NVarChar(2),
  @EntryEnabled Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_TaskID Int = null OUTPUT 
  AS
  INSERT [TOS_UserTasks]
  (
   [UserID]
  ,[TaskID]
  ,[TaskTypeID]
  ,[EntryEnabled]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@TaskID
  ,@TaskTypeID
  ,@EntryEnabled
  )
  SET @Return_UserID = @UserID
  SET @Return_TaskID = @TaskID
GO
