USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchInsert]
  @ProcessDate DateTime,
  @FinYear NVarChar(4),
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_ProcessPunch]
  (
   [ProcessDate]
  ,[FinYear]
  )
  VALUES
  (
   @ProcessDate
  ,@FinYear
  )
  SET @Return_RecordID = Scope_Identity()
GO
