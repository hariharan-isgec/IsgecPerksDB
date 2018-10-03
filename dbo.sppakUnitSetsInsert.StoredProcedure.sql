USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsInsert]
  @Description NVarChar(50),
  @BaseUnitID Int,
  @Return_UnitSetID Int = null OUTPUT 
  AS
  INSERT [PAK_UnitSets]
  (
   [Description]
  ,[BaseUnitID]
  )
  VALUES
  (
   @Description
  ,@BaseUnitID
  )
  SET @Return_UnitSetID = Scope_Identity()
GO
