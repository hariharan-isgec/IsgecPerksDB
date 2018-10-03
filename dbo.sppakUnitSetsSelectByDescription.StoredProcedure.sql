USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsSelectByDescription]
  @LoginID NVarChar(8),
  @Description NVarChar(50)  
  AS
  SELECT
    [PAK_UnitSets].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description 
  FROM [PAK_UnitSets] 
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]
  WHERE
  LOWER([PAK_UnitSets].[Description]) = LOWER(@Description)
GO
