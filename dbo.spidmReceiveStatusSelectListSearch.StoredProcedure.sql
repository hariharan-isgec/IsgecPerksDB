USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ReceiveStatusID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (ReceiveStatusID)
  SELECT [IDM_ReceiveStatus].[ReceiveStatusID] FROM [IDM_ReceiveStatus]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_ReceiveStatus].[ReceiveStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_ReceiveStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [IDM_ReceiveStatus].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [IDM_ReceiveStatus].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_ReceiveStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_ReceiveStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_ReceiveStatus].[ReceiveStatusID] ,
		[IDM_ReceiveStatus].[Description]  
  FROM [IDM_ReceiveStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_ReceiveStatus].[ReceiveStatusID] = #PageIndex.ReceiveStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
