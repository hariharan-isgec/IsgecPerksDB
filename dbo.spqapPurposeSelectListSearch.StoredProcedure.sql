USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeSelectListSearch]
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
 ,PurposeID Int NOT NULL
  )
  INSERT INTO #PageIndex (PurposeID)
  SELECT [QAP_Purpose].[PurposeID] FROM [QAP_Purpose]
 WHERE  
   ( 
         STR(ISNULL([QAP_Purpose].[PurposeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Purpose].[PurposeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Purpose].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Purpose].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'PurposeName' THEN [QAP_Purpose].[PurposeName] END,
     CASE @OrderBy WHEN 'PurposeName DESC' THEN [QAP_Purpose].[PurposeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
    	INNER JOIN #PageIndex
          ON [QAP_Purpose].[PurposeID] = #PageIndex.PurposeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
