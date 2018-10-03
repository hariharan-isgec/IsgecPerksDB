USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsInsert]
  @IconName NVarChar(100),
  @IconStyle NVarChar(250),
  @Return_DBIconID Int = null OUTPUT 
  AS
  INSERT [WF_DBIcons]
  (
   [IconName]
  ,[IconStyle]
  )
  VALUES
  (
   @IconName
  ,@IconStyle
  )
  SET @Return_DBIconID = Scope_Identity()
GO
