USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TOS_TaskTypes].[TaskTypeID] ,
		[TOS_TaskTypes].[Description]  
  FROM [TOS_TaskTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'TaskTypeID' THEN [TOS_TaskTypes].[TaskTypeID] END,
     CASE @OrderBy WHEN 'TaskTypeID DESC' THEN [TOS_TaskTypes].[TaskTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_TaskTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_TaskTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
