USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesInsert]
  @Description NVarChar(50),
  @cssClass NVarChar(50),
  @Return_RowTypeID Int = null OUTPUT 
  AS
  INSERT [WF_DBRowTypes]
  (
   [Description]
  ,[cssClass]
  )
  VALUES
  (
   @Description
  ,@cssClass
  )
  SET @Return_RowTypeID = Scope_Identity()
GO
