USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusSelectListSearch]
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
 ,AdviceStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (AdviceStatusID)
  SELECT [SPMT_PAStatus].[AdviceStatusID] FROM [SPMT_PAStatus]
 WHERE  
   ( 
         STR(ISNULL([SPMT_PAStatus].[AdviceStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PAStatus].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PAStatus].[NextStatusID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AdviceStatusID' THEN [SPMT_PAStatus].[AdviceStatusID] END,
     CASE @OrderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PAStatus].[AdviceStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_PAStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_PAStatus].[Description] END DESC,
     CASE @OrderBy WHEN 'NextStatusID' THEN [SPMT_PAStatus].[NextStatusID] END,
     CASE @OrderBy WHEN 'NextStatusID DESC' THEN [SPMT_PAStatus].[NextStatusID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_PAStatus].*  
  FROM [SPMT_PAStatus] 
      INNER JOIN #PageIndex
          ON [SPMT_PAStatus].[AdviceStatusID] = #PageIndex.AdviceStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
