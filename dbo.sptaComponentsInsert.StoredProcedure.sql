USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsInsert]
  @Description NVarChar(50),
  @Return_ComponentID Int = null OUTPUT 
  AS
  INSERT [TA_Components]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ComponentID = Scope_Identity()
GO
