USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysInsert]
  @Holiday DateTime,
  @OfficeID Int,
  @Description NVarChar(30),
  @PunchStatusID NVarChar(2),
  @FinYear NVarChar(4),
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_Holidays]
  (
   [Holiday]
  ,[OfficeID]
  ,[Description]
  ,[PunchStatusID]
  ,[FinYear]
  )
  VALUES
  (
   @Holiday
  ,@OfficeID
  ,@Description
  ,@PunchStatusID
  ,@FinYear
  )
  SET @Return_RecordID = Scope_Identity()
GO
