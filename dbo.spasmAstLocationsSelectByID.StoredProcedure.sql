USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsSelectByID]
  @LocationID NVarChar(20) 
  AS
  SELECT
		[ASM_AstLocations].[LocationID],
		[ASM_AstLocations].[Description] 
  FROM [ASM_AstLocations] 
  WHERE
  [ASM_AstLocations].[LocationID] = @LocationID
GO
