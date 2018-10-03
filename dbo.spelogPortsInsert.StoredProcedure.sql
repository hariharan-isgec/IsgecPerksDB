USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsInsert]
  @Description NVarChar(100),
  @Return_PortID Int = null OUTPUT 
  AS
  INSERT [ELOG_Ports]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_PortID = Scope_Identity()
GO
