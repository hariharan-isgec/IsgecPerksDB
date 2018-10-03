USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesSelectListSearch]
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
  SELECT [TA_LCModes].[ModeID] FROM [TA_LCModes]
 WHERE  
   ( 
         STR(ISNULL([TA_LCModes].[ModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_LCModes].[ModeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_LCModes].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ModeID' THEN [TA_LCModes].[ModeID] END,
     CASE @OrderBy WHEN 'ModeID DESC' THEN [TA_LCModes].[ModeID] END DESC,
     CASE @OrderBy WHEN 'ModeName' THEN [TA_LCModes].[ModeName] END,
     CASE @OrderBy WHEN 'ModeName DESC' THEN [TA_LCModes].[ModeName] END DESC,
     CASE @OrderBy WHEN 'OutOfSequence' THEN [TA_LCModes].[OutOfSequence] END,
     CASE @OrderBy WHEN 'OutOfSequence DESC' THEN [TA_LCModes].[OutOfSequence] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TA_LCModes].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TA_LCModes].[Sequence] END DESC,
     CASE @OrderBy WHEN 'UnderMilageClaim' THEN [TA_LCModes].[UnderMilageClaim] END,
     CASE @OrderBy WHEN 'UnderMilageClaim DESC' THEN [TA_LCModes].[UnderMilageClaim] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_LCModes].[ModeID] ,
		[TA_LCModes].[ModeName] ,
		[TA_LCModes].[OutOfSequence] ,
		[TA_LCModes].[Sequence] ,
		[TA_LCModes].[UnderMilageClaim]  
  FROM [TA_LCModes] 
      INNER JOIN #PageIndex
          ON [TA_LCModes].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
