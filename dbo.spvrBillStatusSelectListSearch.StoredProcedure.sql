USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusSelectListSearch]
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
 ,BillStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (BillStatusID)
  SELECT [VR_BillStatus].[BillStatusID] FROM [VR_BillStatus]
 WHERE  
   ( 
         STR(ISNULL([VR_BillStatus].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BillStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [VR_BillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [VR_BillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_BillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_BillStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_BillStatus].[BillStatusID] ,
		[VR_BillStatus].[Description]  
  FROM [VR_BillStatus] 
    	INNER JOIN #PageIndex
          ON [VR_BillStatus].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
