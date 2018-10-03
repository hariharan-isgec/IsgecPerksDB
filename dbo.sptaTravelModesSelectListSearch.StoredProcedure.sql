USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesSelectListSearch]
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
  SELECT [TA_TravelModes].[ModeID] FROM [TA_TravelModes]
 WHERE  
   ( 
         STR(ISNULL([TA_TravelModes].[ModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelModes].[ModeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_TravelModes].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ModeID' THEN [TA_TravelModes].[ModeID] END,
     CASE @OrderBy WHEN 'ModeID DESC' THEN [TA_TravelModes].[ModeID] END DESC,
     CASE @OrderBy WHEN 'ModeName' THEN [TA_TravelModes].[ModeName] END,
     CASE @OrderBy WHEN 'ModeName DESC' THEN [TA_TravelModes].[ModeName] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TA_TravelModes].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TA_TravelModes].[Sequence] END DESC,
     CASE @OrderBy WHEN 'OutOfSequence' THEN [TA_TravelModes].[OutOfSequence] END,
     CASE @OrderBy WHEN 'OutOfSequence DESC' THEN [TA_TravelModes].[OutOfSequence] END DESC,
     CASE @OrderBy WHEN 'UnderMilageClaim' THEN [TA_TravelModes].[UnderMilageClaim] END,
     CASE @OrderBy WHEN 'UnderMilageClaim DESC' THEN [TA_TravelModes].[UnderMilageClaim] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_TravelModes].[ModeID] ,
		[TA_TravelModes].[ModeName] ,
		[TA_TravelModes].[Sequence] ,
		[TA_TravelModes].[OutOfSequence] ,
		[TA_TravelModes].[UnderMilageClaim]  
  FROM [TA_TravelModes] 
      INNER JOIN #PageIndex
          ON [TA_TravelModes].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
