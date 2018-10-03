USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportSelectListSearch]
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
 ,ModeID Int NOT NULL
  )
  INSERT INTO #PageIndex (ModeID)
  SELECT [SPMT_ModeOfTransport].[ModeID] FROM [SPMT_ModeOfTransport]
 WHERE  
   ( 
         STR(ISNULL([SPMT_ModeOfTransport].[ModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ModeOfTransport].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ModeID' THEN [SPMT_ModeOfTransport].[ModeID] END,
     CASE @OrderBy WHEN 'ModeID DESC' THEN [SPMT_ModeOfTransport].[ModeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ModeOfTransport].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ModeOfTransport].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ModeOfTransport].*  
  FROM [SPMT_ModeOfTransport] 
      INNER JOIN #PageIndex
          ON [SPMT_ModeOfTransport].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
