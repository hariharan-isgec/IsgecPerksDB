USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastLocationsSelectByID]
  @LocationID Int
  AS
  SELECT
		[AST_Locations].[LocationID],
		[AST_Locations].[Descriptions] 
  FROM [AST_Locations] 
  WHERE
  [AST_Locations].[LocationID] = @LocationID
GO
