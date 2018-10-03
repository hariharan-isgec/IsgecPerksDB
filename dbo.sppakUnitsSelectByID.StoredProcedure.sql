USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsSelectByID]
  @LoginID NVarChar(8),
  @UnitID Int 
  AS
  SELECT
    [PAK_Units].* ,
    [PAK_UnitSets1].[Description] AS PAK_UnitSets1_Description 
  FROM [PAK_Units] 
  LEFT OUTER JOIN [PAK_UnitSets] AS [PAK_UnitSets1]
    ON [PAK_Units].[UnitSetID] = [PAK_UnitSets1].[UnitSetID]
  WHERE
  [PAK_Units].[UnitID] = @UnitID
GO
