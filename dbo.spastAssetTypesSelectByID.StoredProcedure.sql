USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesSelectByID]
  @AssetTypeID Int
  AS
  SELECT
		[AST_AssetTypes].[AssetTypeID],
		[AST_AssetTypes].[Description] 
  FROM [AST_AssetTypes] 
  WHERE
  [AST_AssetTypes].[AssetTypeID] = @AssetTypeID
GO
