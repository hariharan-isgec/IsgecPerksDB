USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPrioritySelectListSearch]
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
 ,PriorityID Int NOT NULL
  )
  INSERT INTO #PageIndex (PriorityID)
  SELECT [ERP_RequestPriority].[PriorityID] FROM [ERP_RequestPriority]
 WHERE  
   ( 
         STR(ISNULL([ERP_RequestPriority].[PriorityID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_RequestPriority].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PriorityID' THEN [ERP_RequestPriority].[PriorityID] END,
     CASE @OrderBy WHEN 'PriorityID DESC' THEN [ERP_RequestPriority].[PriorityID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestPriority].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestPriority].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestPriority].[PriorityID] ,
		[ERP_RequestPriority].[Description]  
  FROM [ERP_RequestPriority] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestPriority].[PriorityID] = #PageIndex.PriorityID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
