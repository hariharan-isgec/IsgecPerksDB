USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorSelectListSearch]
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
 ,OriginatorID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (OriginatorID)
  SELECT [IDM_Originator].[OriginatorID] FROM [IDM_Originator]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_Originator].[OriginatorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Originator].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'OriginatorID' THEN [IDM_Originator].[OriginatorID] END,
     CASE @orderBy WHEN 'OriginatorID DESC' THEN [IDM_Originator].[OriginatorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Originator].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Originator].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_Originator].[OriginatorID] ,
		[IDM_Originator].[Description]  
  FROM [IDM_Originator] 
    	INNER JOIN #PageIndex
          ON [IDM_Originator].[OriginatorID] = #PageIndex.OriginatorID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
