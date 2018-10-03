USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsInsert]
  @ServeyID Int,
  @Description NVarChar(50),
  @Return_ServeySheetID Int = null OUTPUT
  AS
  INSERT [HRM_ServeySheets]
  (
   [ServeyID]
  ,[Description]
  )
  VALUES
  (
   @ServeyID
  ,@Description
  )
  SET @Return_ServeySheetID = Scope_Identity()
GO
