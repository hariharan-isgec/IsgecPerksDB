USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigSelectListSearch]
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
 ,GreetingID Int NOT NULL
  )
  INSERT INTO #PageIndex (GreetingID)
  SELECT [GRT_Config].[GreetingID] FROM [GRT_Config]
  LEFT OUTER JOIN [GRT_Images] AS [GRT_Images1]
    ON [GRT_Config].[ImageID] = [GRT_Images1].[ImageID]
 WHERE  
   ( 
         STR(ISNULL([GRT_Config].[GreetingID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Config].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Config].[DearText],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Config].[GreetingText],'')) LIKE @KeyWord1
     OR STR(ISNULL([GRT_Config].[ImageID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([GRT_Config].[ImageHeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([GRT_Config].[ImageWidth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Config].[BottomText],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GreetingID' THEN [GRT_Config].[GreetingID] END,
     CASE @OrderBy WHEN 'GreetingID DESC' THEN [GRT_Config].[GreetingID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [GRT_Config].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [GRT_Config].[Description] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [GRT_Config].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [GRT_Config].[FromDate] END DESC,
     CASE @OrderBy WHEN 'TillDate' THEN [GRT_Config].[TillDate] END,
     CASE @OrderBy WHEN 'TillDate DESC' THEN [GRT_Config].[TillDate] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [GRT_Config].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [GRT_Config].[Active] END DESC,
     CASE @OrderBy WHEN 'EnableDear' THEN [GRT_Config].[EnableDear] END,
     CASE @OrderBy WHEN 'EnableDear DESC' THEN [GRT_Config].[EnableDear] END DESC,
     CASE @OrderBy WHEN 'DearText' THEN [GRT_Config].[DearText] END,
     CASE @OrderBy WHEN 'DearText DESC' THEN [GRT_Config].[DearText] END DESC,
     CASE @OrderBy WHEN 'EnableGreetingText' THEN [GRT_Config].[EnableGreetingText] END,
     CASE @OrderBy WHEN 'EnableGreetingText DESC' THEN [GRT_Config].[EnableGreetingText] END DESC,
     CASE @OrderBy WHEN 'GreetingText' THEN [GRT_Config].[GreetingText] END,
     CASE @OrderBy WHEN 'GreetingText DESC' THEN [GRT_Config].[GreetingText] END DESC,
     CASE @OrderBy WHEN 'EnableImage' THEN [GRT_Config].[EnableImage] END,
     CASE @OrderBy WHEN 'EnableImage DESC' THEN [GRT_Config].[EnableImage] END DESC,
     CASE @OrderBy WHEN 'ImageID' THEN [GRT_Config].[ImageID] END,
     CASE @OrderBy WHEN 'ImageID DESC' THEN [GRT_Config].[ImageID] END DESC,
     CASE @OrderBy WHEN 'UseDefaultImageSize' THEN [GRT_Config].[UseDefaultImageSize] END,
     CASE @OrderBy WHEN 'UseDefaultImageSize DESC' THEN [GRT_Config].[UseDefaultImageSize] END DESC,
     CASE @OrderBy WHEN 'ImageHeight' THEN [GRT_Config].[ImageHeight] END,
     CASE @OrderBy WHEN 'ImageHeight DESC' THEN [GRT_Config].[ImageHeight] END DESC,
     CASE @OrderBy WHEN 'ImageWidth' THEN [GRT_Config].[ImageWidth] END,
     CASE @OrderBy WHEN 'ImageWidth DESC' THEN [GRT_Config].[ImageWidth] END DESC,
     CASE @OrderBy WHEN 'EnableBottomText' THEN [GRT_Config].[EnableBottomText] END,
     CASE @OrderBy WHEN 'EnableBottomText DESC' THEN [GRT_Config].[EnableBottomText] END DESC,
     CASE @OrderBy WHEN 'BottomText' THEN [GRT_Config].[BottomText] END,
     CASE @OrderBy WHEN 'BottomText DESC' THEN [GRT_Config].[BottomText] END DESC,
     CASE @OrderBy WHEN 'EnableSignature' THEN [GRT_Config].[EnableSignature] END,
     CASE @OrderBy WHEN 'EnableSignature DESC' THEN [GRT_Config].[EnableSignature] END DESC,
     CASE @OrderBy WHEN 'IncludeDesignation' THEN [GRT_Config].[IncludeDesignation] END,
     CASE @OrderBy WHEN 'IncludeDesignation DESC' THEN [GRT_Config].[IncludeDesignation] END DESC,
     CASE @OrderBy WHEN 'IncludeDepartment' THEN [GRT_Config].[IncludeDepartment] END,
     CASE @OrderBy WHEN 'IncludeDepartment DESC' THEN [GRT_Config].[IncludeDepartment] END DESC,
     CASE @OrderBy WHEN 'IncludeDirectNo' THEN [GRT_Config].[IncludeDirectNo] END,
     CASE @OrderBy WHEN 'IncludeDirectNo DESC' THEN [GRT_Config].[IncludeDirectNo] END DESC,
     CASE @OrderBy WHEN 'IncludeCellNo' THEN [GRT_Config].[IncludeCellNo] END,
     CASE @OrderBy WHEN 'IncludeCellNo DESC' THEN [GRT_Config].[IncludeCellNo] END DESC,
     CASE @OrderBy WHEN 'GRT_Images1_Description' THEN [GRT_Images1].[Description] END,
     CASE @OrderBy WHEN 'GRT_Images1_Description DESC' THEN [GRT_Images1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[GRT_Config].[GreetingID] ,
		[GRT_Config].[Description] ,
		[GRT_Config].[FromDate] ,
		[GRT_Config].[TillDate] ,
		[GRT_Config].[Active] ,
		[GRT_Config].[EnableDear] ,
		[GRT_Config].[DearText] ,
		[GRT_Config].[EnableGreetingText] ,
		[GRT_Config].[GreetingText] ,
		[GRT_Config].[EnableImage] ,
		[GRT_Config].[ImageID] ,
		[GRT_Config].[UseDefaultImageSize] ,
		[GRT_Config].[ImageHeight] ,
		[GRT_Config].[ImageWidth] ,
		[GRT_Config].[EnableBottomText] ,
		[GRT_Config].[BottomText] ,
		[GRT_Config].[EnableSignature] ,
		[GRT_Config].[IncludeDesignation] ,
		[GRT_Config].[IncludeDepartment] ,
		[GRT_Config].[IncludeDirectNo] ,
		[GRT_Config].[IncludeCellNo] ,
		[GRT_Images1].[Description] AS GRT_Images1_Description 
  FROM [GRT_Config] 
    	INNER JOIN #PageIndex
          ON [GRT_Config].[GreetingID] = #PageIndex.GreetingID
  LEFT OUTER JOIN [GRT_Images] AS [GRT_Images1]
    ON [GRT_Config].[ImageID] = [GRT_Images1].[ImageID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
