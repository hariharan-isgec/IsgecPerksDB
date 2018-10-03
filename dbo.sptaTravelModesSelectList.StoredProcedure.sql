USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_TravelModes].[ModeID] ,
		[TA_TravelModes].[ModeName] ,
		[TA_TravelModes].[Sequence] ,
		[TA_TravelModes].[OutOfSequence] ,
		[TA_TravelModes].[UnderMilageClaim]  
  FROM [TA_TravelModes] 
  WHERE 1 = 1  
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
GO
