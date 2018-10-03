USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesSelectByID]
  @LoginID NVarChar(8),
  @StuffingTypeID Int 
  AS
  SELECT
    [ELOG_StuffingTypes].*  
  FROM [ELOG_StuffingTypes] 
  WHERE
  [ELOG_StuffingTypes].[StuffingTypeID] = @StuffingTypeID
GO
