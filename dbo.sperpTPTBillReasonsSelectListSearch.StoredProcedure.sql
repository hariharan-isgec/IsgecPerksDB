USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillReasonsSelectListSearch]
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
 ,ReasonID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReasonID)
  SELECT [ERP_TPTBillReasons].[ReasonID] FROM [ERP_TPTBillReasons]
 WHERE  
   ( 
         STR(ISNULL([ERP_TPTBillReasons].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_TPTBillReasons].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [ERP_TPTBillReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [ERP_TPTBillReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_TPTBillReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_TPTBillReasons].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_TPTBillReasons].[ReasonID] ,
		[ERP_TPTBillReasons].[Description]  
  FROM [ERP_TPTBillReasons] 
    	INNER JOIN #PageIndex
          ON [ERP_TPTBillReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
