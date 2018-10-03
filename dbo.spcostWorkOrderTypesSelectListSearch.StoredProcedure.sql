USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,WorkOrderTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (WorkOrderTypeID)
  SELECT [COST_WorkOrderTypes].[WorkOrderTypeID] FROM [COST_WorkOrderTypes]
 WHERE  
   ( 
         STR(ISNULL([COST_WorkOrderTypes].[WorkOrderTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_WorkOrderTypes].[WorkOrderTypeDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'WorkOrderTypeID' THEN [COST_WorkOrderTypes].[WorkOrderTypeID] END,
     CASE @OrderBy WHEN 'WorkOrderTypeID DESC' THEN [COST_WorkOrderTypes].[WorkOrderTypeID] END DESC,
     CASE @OrderBy WHEN 'WorkOrderTypeDescription' THEN [COST_WorkOrderTypes].[WorkOrderTypeDescription] END,
     CASE @OrderBy WHEN 'WorkOrderTypeDescription DESC' THEN [COST_WorkOrderTypes].[WorkOrderTypeDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_WorkOrderTypes].*  
  FROM [COST_WorkOrderTypes] 
      INNER JOIN #PageIndex
          ON [COST_WorkOrderTypes].[WorkOrderTypeID] = #PageIndex.WorkOrderTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
