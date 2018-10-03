USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonSelectListSearch]
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
  SELECT [SPMT_ReturnReason].[ReasonID] FROM [SPMT_ReturnReason]
 WHERE  
   ( 
         STR(ISNULL([SPMT_ReturnReason].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ReturnReason].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [SPMT_ReturnReason].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [SPMT_ReturnReason].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ReturnReason].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ReturnReason].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ReturnReason].*  
  FROM [SPMT_ReturnReason] 
      INNER JOIN #PageIndex
          ON [SPMT_ReturnReason].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
