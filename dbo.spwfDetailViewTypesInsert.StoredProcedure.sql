USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesInsert]
  @DVTypeDescription NVarChar(50),
  @Return_DVTypeID Int = null OUTPUT 
  AS
  INSERT [WF_DetailViewTypes]
  (
   [DVTypeDescription]
  )
  VALUES
  (
   @DVTypeDescription
  )
  SET @Return_DVTypeID = Scope_Identity()
GO
