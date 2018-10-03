USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesSelectByID]
  @AssetTypeID NVarChar(10) 
  AS
  SELECT
		[ASM_AstTypes].[AssetTypeID],
		[ASM_AstTypes].[Description],
		[ASM_AstTypes].[IssueToLocation] 
  FROM [ASM_AstTypes] 
  WHERE
  [ASM_AstTypes].[AssetTypeID] = @AssetTypeID
GO
