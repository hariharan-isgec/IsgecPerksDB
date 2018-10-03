USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemesInsert]
  @Description NVarChar(50),
  @Details NVarChar(100),
  @ServeyID Int,
  @Return_ThemeID Int = null OUTPUT
  AS
  INSERT [HRM_ServeyThemes]
  (
   [Description]
  ,[Details]
  ,[ServeyID]
  )
  VALUES
  (
   @Description
  ,@Details
  ,@ServeyID
  )
  SET @Return_ThemeID = Scope_Identity()
GO
