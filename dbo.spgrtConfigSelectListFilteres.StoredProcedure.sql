USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GreetingID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GreetingID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[GRT_Config].[GreetingID]'
  SET @LGSQL = @LGSQL + ' FROM [GRT_Config] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [GRT_Images] AS [GRT_Images1]'
  SET @LGSQL = @LGSQL + '    ON [GRT_Config].[ImageID] = [GRT_Images1].[ImageID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GreetingID' THEN '[GRT_Config].[GreetingID]'
                        WHEN 'GreetingID DESC' THEN '[GRT_Config].[GreetingID] DESC'
                        WHEN 'Description' THEN '[GRT_Config].[Description]'
                        WHEN 'Description DESC' THEN '[GRT_Config].[Description] DESC'
                        WHEN 'FromDate' THEN '[GRT_Config].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[GRT_Config].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[GRT_Config].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[GRT_Config].[TillDate] DESC'
                        WHEN 'Active' THEN '[GRT_Config].[Active]'
                        WHEN 'Active DESC' THEN '[GRT_Config].[Active] DESC'
                        WHEN 'EnableDear' THEN '[GRT_Config].[EnableDear]'
                        WHEN 'EnableDear DESC' THEN '[GRT_Config].[EnableDear] DESC'
                        WHEN 'DearText' THEN '[GRT_Config].[DearText]'
                        WHEN 'DearText DESC' THEN '[GRT_Config].[DearText] DESC'
                        WHEN 'EnableGreetingText' THEN '[GRT_Config].[EnableGreetingText]'
                        WHEN 'EnableGreetingText DESC' THEN '[GRT_Config].[EnableGreetingText] DESC'
                        WHEN 'GreetingText' THEN '[GRT_Config].[GreetingText]'
                        WHEN 'GreetingText DESC' THEN '[GRT_Config].[GreetingText] DESC'
                        WHEN 'EnableImage' THEN '[GRT_Config].[EnableImage]'
                        WHEN 'EnableImage DESC' THEN '[GRT_Config].[EnableImage] DESC'
                        WHEN 'ImageID' THEN '[GRT_Config].[ImageID]'
                        WHEN 'ImageID DESC' THEN '[GRT_Config].[ImageID] DESC'
                        WHEN 'UseDefaultImageSize' THEN '[GRT_Config].[UseDefaultImageSize]'
                        WHEN 'UseDefaultImageSize DESC' THEN '[GRT_Config].[UseDefaultImageSize] DESC'
                        WHEN 'ImageHeight' THEN '[GRT_Config].[ImageHeight]'
                        WHEN 'ImageHeight DESC' THEN '[GRT_Config].[ImageHeight] DESC'
                        WHEN 'ImageWidth' THEN '[GRT_Config].[ImageWidth]'
                        WHEN 'ImageWidth DESC' THEN '[GRT_Config].[ImageWidth] DESC'
                        WHEN 'EnableBottomText' THEN '[GRT_Config].[EnableBottomText]'
                        WHEN 'EnableBottomText DESC' THEN '[GRT_Config].[EnableBottomText] DESC'
                        WHEN 'BottomText' THEN '[GRT_Config].[BottomText]'
                        WHEN 'BottomText DESC' THEN '[GRT_Config].[BottomText] DESC'
                        WHEN 'EnableSignature' THEN '[GRT_Config].[EnableSignature]'
                        WHEN 'EnableSignature DESC' THEN '[GRT_Config].[EnableSignature] DESC'
                        WHEN 'IncludeDesignation' THEN '[GRT_Config].[IncludeDesignation]'
                        WHEN 'IncludeDesignation DESC' THEN '[GRT_Config].[IncludeDesignation] DESC'
                        WHEN 'IncludeDepartment' THEN '[GRT_Config].[IncludeDepartment]'
                        WHEN 'IncludeDepartment DESC' THEN '[GRT_Config].[IncludeDepartment] DESC'
                        WHEN 'IncludeDirectNo' THEN '[GRT_Config].[IncludeDirectNo]'
                        WHEN 'IncludeDirectNo DESC' THEN '[GRT_Config].[IncludeDirectNo] DESC'
                        WHEN 'IncludeCellNo' THEN '[GRT_Config].[IncludeCellNo]'
                        WHEN 'IncludeCellNo DESC' THEN '[GRT_Config].[IncludeCellNo] DESC'
                        WHEN 'GRT_Images1_Description' THEN '[GRT_Images1].[Description]'
                        WHEN 'GRT_Images1_Description DESC' THEN '[GRT_Images1].[Description] DESC'
                        ELSE '[GRT_Config].[GreetingID]'
                    END
  EXEC (@LGSQL)

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
