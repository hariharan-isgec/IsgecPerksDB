USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [QAP_States].[StatusID] FROM [QAP_States]
 WHERE  
   ( 
         STR(ISNULL([QAP_States].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_States].[QAPStatus],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_States].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_States].[StatusID] END DESC,
     CASE @OrderBy WHEN 'QAPStatus' THEN [QAP_States].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAPStatus DESC' THEN [QAP_States].[QAPStatus] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_States].[StatusID] ,
		[QAP_States].[QAPStatus]  
  FROM [QAP_States] 
    	INNER JOIN #PageIndex
          ON [QAP_States].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
