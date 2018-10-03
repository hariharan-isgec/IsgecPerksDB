USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentStatesSelectListSearch]
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
  SELECT [QAP_AttachmentStates].[StatusID] FROM [QAP_AttachmentStates]
 WHERE  
   ( 
         STR(ISNULL([QAP_AttachmentStates].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_AttachmentStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_AttachmentStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_AttachmentStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QAP_AttachmentStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QAP_AttachmentStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_AttachmentStates].[StatusID] ,
		[QAP_AttachmentStates].[Description]  
  FROM [QAP_AttachmentStates] 
    	INNER JOIN #PageIndex
          ON [QAP_AttachmentStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
