USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesSelectByID]
  @LoginID NVarChar(8),
  @BreakbulkTypeID Int 
  AS
  SELECT
    [ELOG_BreakbulkTypes].*  
  FROM [ELOG_BreakbulkTypes] 
  WHERE
  [ELOG_BreakbulkTypes].[BreakbulkTypeID] = @BreakbulkTypeID
GO
