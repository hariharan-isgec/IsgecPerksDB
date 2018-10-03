USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsSelectByID]
  @LoginID NVarChar(8),
  @UnitSetID Int 
  AS
  SELECT
    [PAK_UnitSets].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description 
  FROM [PAK_UnitSets] 
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]
  WHERE
  [PAK_UnitSets].[UnitSetID] = @UnitSetID
GO
