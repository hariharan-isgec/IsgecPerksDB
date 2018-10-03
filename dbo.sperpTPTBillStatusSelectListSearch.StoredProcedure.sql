USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusSelectListSearch]
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
  SELECT [ERP_TPTBillStatus].[BillStatusID] FROM [ERP_TPTBillStatus]
 WHERE  
   ( 
         STR(ISNULL([ERP_TPTBillStatus].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TPTBillStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [ERP_TPTBillStatus].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [ERP_TPTBillStatus].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_TPTBillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_TPTBillStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_TPTBillStatus].[BillStatusID] ,
		[ERP_TPTBillStatus].[Description]  
  FROM [ERP_TPTBillStatus] 
    	INNER JOIN #PageIndex
          ON [ERP_TPTBillStatus].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
