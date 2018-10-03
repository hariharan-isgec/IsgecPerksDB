USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_LCModes].[ModeID] ,
		[TA_LCModes].[ModeName] ,
		[TA_LCModes].[OutOfSequence] ,
		[TA_LCModes].[Sequence] ,
		[TA_LCModes].[UnderMilageClaim]  
  FROM [TA_LCModes] 
  WHERE 1 = 1  
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
GO
