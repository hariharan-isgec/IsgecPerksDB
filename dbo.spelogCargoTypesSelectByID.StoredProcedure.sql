USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesSelectByID]
  @LoginID NVarChar(8),
  @CargoTypeID Int 
  AS
  SELECT
    [ELOG_CargoTypes].*  
  FROM [ELOG_CargoTypes] 
  WHERE
  [ELOG_CargoTypes].[CargoTypeID] = @CargoTypeID
GO
