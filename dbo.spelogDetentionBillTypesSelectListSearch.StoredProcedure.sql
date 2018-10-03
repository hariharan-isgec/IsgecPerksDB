USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesSelectListSearch]
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
 ,BillTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (BillTypeID)
  SELECT [ELOG_DetentionBillTypes].[BillTypeID] FROM [ELOG_DetentionBillTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_DetentionBillTypes].[BillTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBillTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillTypeID' THEN [ELOG_DetentionBillTypes].[BillTypeID] END,
     CASE @OrderBy WHEN 'BillTypeID DESC' THEN [ELOG_DetentionBillTypes].[BillTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_DetentionBillTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_DetentionBillTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_DetentionBillTypes].*  
  FROM [ELOG_DetentionBillTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_DetentionBillTypes].[BillTypeID] = #PageIndex.BillTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
