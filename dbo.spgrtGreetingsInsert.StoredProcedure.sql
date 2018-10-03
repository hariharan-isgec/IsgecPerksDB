USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsInsert]
  @UserID NVarChar(8),
  @ToEmailID NVarChar(100),
  @ToName NVarChar(100),
  @SentOn DateTime,
  @UsingGreetingID Int,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [GRT_Greetings]
  (
   [UserID]
  ,[ToEmailID]
  ,[ToName]
  ,[SentOn]
  ,[UsingGreetingID]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@ToEmailID
  ,@ToName
  ,@SentOn
  ,@UsingGreetingID
  )
  SET @Return_UserID = @UserID
  SET @Return_SerialNo = Scope_Identity()
GO
