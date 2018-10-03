USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesSelectByID]
  @LoginID NVarChar(8),
  @BLTypeID Int 
  AS
  SELECT
    [ELOG_BLTypes].*  
  FROM [ELOG_BLTypes] 
  WHERE
  [ELOG_BLTypes].[BLTypeID] = @BLTypeID
GO
