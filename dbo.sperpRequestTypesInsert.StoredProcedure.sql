USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesInsert]
  @Description NVarChar(50),
  @Return_RequestTypeID Int = null OUTPUT 
  AS
  INSERT [ERP_RequestTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_RequestTypeID = Scope_Identity()
GO
