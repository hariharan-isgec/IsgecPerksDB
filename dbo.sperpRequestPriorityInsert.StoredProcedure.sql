USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPriorityInsert]
  @Description NVarChar(50),
  @Return_PriorityID Int = null OUTPUT 
  AS
  INSERT [ERP_RequestPriority]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_PriorityID = Scope_Identity()
GO
