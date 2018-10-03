USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
 ,ProgressID Int NOT NULL
 ,CLPID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, ProgressID, CLPID)
  SELECT [TOS_CLPDataDetails].[ProjectID], [TOS_CLPDataDetails].[ProgressID], [TOS_CLPDataDetails].[CLPID] FROM [TOS_CLPDataDetails]
  INNER JOIN [TOS_CLPData] AS [TOS_CLPData1]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData1].[ProjectID]
    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData1].[ProgressID]
  INNER JOIN [TOS_CLPs] AS [TOS_CLPs2]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs2].[ProjectID]
    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs2].[CLPID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects3]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_Projects3].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_CLPDataDetails].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[ProgressID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[CLPID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[Quantity],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[DisplayType],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[engdelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[engdelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[orddelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[orddelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[desdelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[desdelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[eredelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[eredelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[iodelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[iodelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[recdelayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[recdelayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[ad1delayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[ad1delayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[ad2delayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[ad2delayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[ad3delayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[ad3delayStatus],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPDataDetails].[ad4delayDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPDataDetails].[ad4delayStatus],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPDataDetails].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPDataDetails].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProgressID' THEN [TOS_CLPDataDetails].[ProgressID] END,
     CASE @OrderBy WHEN 'ProgressID DESC' THEN [TOS_CLPDataDetails].[ProgressID] END DESC,
     CASE @OrderBy WHEN 'CLPID' THEN [TOS_CLPDataDetails].[CLPID] END,
     CASE @OrderBy WHEN 'CLPID DESC' THEN [TOS_CLPDataDetails].[CLPID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_CLPDataDetails].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_CLPDataDetails].[Description] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [TOS_CLPDataDetails].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [TOS_CLPDataDetails].[Quantity] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TOS_CLPDataDetails].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TOS_CLPDataDetails].[Sequence] END DESC,
     CASE @OrderBy WHEN 'DisplayType' THEN [TOS_CLPDataDetails].[DisplayType] END,
     CASE @OrderBy WHEN 'DisplayType DESC' THEN [TOS_CLPDataDetails].[DisplayType] END DESC,
     CASE @OrderBy WHEN 'engEndtDefined' THEN [TOS_CLPDataDetails].[engEndtDefined] END,
     CASE @OrderBy WHEN 'engEndtDefined DESC' THEN [TOS_CLPDataDetails].[engEndtDefined] END DESC,
     CASE @OrderBy WHEN 'engEndtActual' THEN [TOS_CLPDataDetails].[engEndtActual] END,
     CASE @OrderBy WHEN 'engEndtActual DESC' THEN [TOS_CLPDataDetails].[engEndtActual] END DESC,
     CASE @OrderBy WHEN 'engdelayDays' THEN [TOS_CLPDataDetails].[engdelayDays] END,
     CASE @OrderBy WHEN 'engdelayDays DESC' THEN [TOS_CLPDataDetails].[engdelayDays] END DESC,
     CASE @OrderBy WHEN 'engdelayStatus' THEN [TOS_CLPDataDetails].[engdelayStatus] END,
     CASE @OrderBy WHEN 'engdelayStatus DESC' THEN [TOS_CLPDataDetails].[engdelayStatus] END DESC,
     CASE @OrderBy WHEN 'ordEndtDefined' THEN [TOS_CLPDataDetails].[ordEndtDefined] END,
     CASE @OrderBy WHEN 'ordEndtDefined DESC' THEN [TOS_CLPDataDetails].[ordEndtDefined] END DESC,
     CASE @OrderBy WHEN 'ordEndtActual' THEN [TOS_CLPDataDetails].[ordEndtActual] END,
     CASE @OrderBy WHEN 'ordEndtActual DESC' THEN [TOS_CLPDataDetails].[ordEndtActual] END DESC,
     CASE @OrderBy WHEN 'orddelayDays' THEN [TOS_CLPDataDetails].[orddelayDays] END,
     CASE @OrderBy WHEN 'orddelayDays DESC' THEN [TOS_CLPDataDetails].[orddelayDays] END DESC,
     CASE @OrderBy WHEN 'orddelayStatus' THEN [TOS_CLPDataDetails].[orddelayStatus] END,
     CASE @OrderBy WHEN 'orddelayStatus DESC' THEN [TOS_CLPDataDetails].[orddelayStatus] END DESC,
     CASE @OrderBy WHEN 'desEndtDefined' THEN [TOS_CLPDataDetails].[desEndtDefined] END,
     CASE @OrderBy WHEN 'desEndtDefined DESC' THEN [TOS_CLPDataDetails].[desEndtDefined] END DESC,
     CASE @OrderBy WHEN 'desEndtActual' THEN [TOS_CLPDataDetails].[desEndtActual] END,
     CASE @OrderBy WHEN 'desEndtActual DESC' THEN [TOS_CLPDataDetails].[desEndtActual] END DESC,
     CASE @OrderBy WHEN 'desdelayDays' THEN [TOS_CLPDataDetails].[desdelayDays] END,
     CASE @OrderBy WHEN 'desdelayDays DESC' THEN [TOS_CLPDataDetails].[desdelayDays] END DESC,
     CASE @OrderBy WHEN 'desdelayStatus' THEN [TOS_CLPDataDetails].[desdelayStatus] END,
     CASE @OrderBy WHEN 'desdelayStatus DESC' THEN [TOS_CLPDataDetails].[desdelayStatus] END DESC,
     CASE @OrderBy WHEN 'ereEndtDefined' THEN [TOS_CLPDataDetails].[ereEndtDefined] END,
     CASE @OrderBy WHEN 'ereEndtDefined DESC' THEN [TOS_CLPDataDetails].[ereEndtDefined] END DESC,
     CASE @OrderBy WHEN 'ereEndtActual' THEN [TOS_CLPDataDetails].[ereEndtActual] END,
     CASE @OrderBy WHEN 'ereEndtActual DESC' THEN [TOS_CLPDataDetails].[ereEndtActual] END DESC,
     CASE @OrderBy WHEN 'eredelayDays' THEN [TOS_CLPDataDetails].[eredelayDays] END,
     CASE @OrderBy WHEN 'eredelayDays DESC' THEN [TOS_CLPDataDetails].[eredelayDays] END DESC,
     CASE @OrderBy WHEN 'eredelayStatus' THEN [TOS_CLPDataDetails].[eredelayStatus] END,
     CASE @OrderBy WHEN 'eredelayStatus DESC' THEN [TOS_CLPDataDetails].[eredelayStatus] END DESC,
     CASE @OrderBy WHEN 'ioEndtDefined' THEN [TOS_CLPDataDetails].[ioEndtDefined] END,
     CASE @OrderBy WHEN 'ioEndtDefined DESC' THEN [TOS_CLPDataDetails].[ioEndtDefined] END DESC,
     CASE @OrderBy WHEN 'ioEndtActual' THEN [TOS_CLPDataDetails].[ioEndtActual] END,
     CASE @OrderBy WHEN 'ioEndtActual DESC' THEN [TOS_CLPDataDetails].[ioEndtActual] END DESC,
     CASE @OrderBy WHEN 'iodelayDays' THEN [TOS_CLPDataDetails].[iodelayDays] END,
     CASE @OrderBy WHEN 'iodelayDays DESC' THEN [TOS_CLPDataDetails].[iodelayDays] END DESC,
     CASE @OrderBy WHEN 'iodelayStatus' THEN [TOS_CLPDataDetails].[iodelayStatus] END,
     CASE @OrderBy WHEN 'iodelayStatus DESC' THEN [TOS_CLPDataDetails].[iodelayStatus] END DESC,
     CASE @OrderBy WHEN 'recEndtDefined' THEN [TOS_CLPDataDetails].[recEndtDefined] END,
     CASE @OrderBy WHEN 'recEndtDefined DESC' THEN [TOS_CLPDataDetails].[recEndtDefined] END DESC,
     CASE @OrderBy WHEN 'recEndtActual' THEN [TOS_CLPDataDetails].[recEndtActual] END,
     CASE @OrderBy WHEN 'recEndtActual DESC' THEN [TOS_CLPDataDetails].[recEndtActual] END DESC,
     CASE @OrderBy WHEN 'recdelayDays' THEN [TOS_CLPDataDetails].[recdelayDays] END,
     CASE @OrderBy WHEN 'recdelayDays DESC' THEN [TOS_CLPDataDetails].[recdelayDays] END DESC,
     CASE @OrderBy WHEN 'recdelayStatus' THEN [TOS_CLPDataDetails].[recdelayStatus] END,
     CASE @OrderBy WHEN 'recdelayStatus DESC' THEN [TOS_CLPDataDetails].[recdelayStatus] END DESC,
     CASE @OrderBy WHEN 'ad1EndtDefined' THEN [TOS_CLPDataDetails].[ad1EndtDefined] END,
     CASE @OrderBy WHEN 'ad1EndtDefined DESC' THEN [TOS_CLPDataDetails].[ad1EndtDefined] END DESC,
     CASE @OrderBy WHEN 'ad1EndtActual' THEN [TOS_CLPDataDetails].[ad1EndtActual] END,
     CASE @OrderBy WHEN 'ad1EndtActual DESC' THEN [TOS_CLPDataDetails].[ad1EndtActual] END DESC,
     CASE @OrderBy WHEN 'ad1delayDays' THEN [TOS_CLPDataDetails].[ad1delayDays] END,
     CASE @OrderBy WHEN 'ad1delayDays DESC' THEN [TOS_CLPDataDetails].[ad1delayDays] END DESC,
     CASE @OrderBy WHEN 'ad1delayStatus' THEN [TOS_CLPDataDetails].[ad1delayStatus] END,
     CASE @OrderBy WHEN 'ad1delayStatus DESC' THEN [TOS_CLPDataDetails].[ad1delayStatus] END DESC,
     CASE @OrderBy WHEN 'ad2EndtDefined' THEN [TOS_CLPDataDetails].[ad2EndtDefined] END,
     CASE @OrderBy WHEN 'ad2EndtDefined DESC' THEN [TOS_CLPDataDetails].[ad2EndtDefined] END DESC,
     CASE @OrderBy WHEN 'ad2EndtActual' THEN [TOS_CLPDataDetails].[ad2EndtActual] END,
     CASE @OrderBy WHEN 'ad2EndtActual DESC' THEN [TOS_CLPDataDetails].[ad2EndtActual] END DESC,
     CASE @OrderBy WHEN 'ad2delayDays' THEN [TOS_CLPDataDetails].[ad2delayDays] END,
     CASE @OrderBy WHEN 'ad2delayDays DESC' THEN [TOS_CLPDataDetails].[ad2delayDays] END DESC,
     CASE @OrderBy WHEN 'ad2delayStatus' THEN [TOS_CLPDataDetails].[ad2delayStatus] END,
     CASE @OrderBy WHEN 'ad2delayStatus DESC' THEN [TOS_CLPDataDetails].[ad2delayStatus] END DESC,
     CASE @OrderBy WHEN 'ad3EndtDefined' THEN [TOS_CLPDataDetails].[ad3EndtDefined] END,
     CASE @OrderBy WHEN 'ad3EndtDefined DESC' THEN [TOS_CLPDataDetails].[ad3EndtDefined] END DESC,
     CASE @OrderBy WHEN 'ad3EndtActual' THEN [TOS_CLPDataDetails].[ad3EndtActual] END,
     CASE @OrderBy WHEN 'ad3EndtActual DESC' THEN [TOS_CLPDataDetails].[ad3EndtActual] END DESC,
     CASE @OrderBy WHEN 'ad3delayDays' THEN [TOS_CLPDataDetails].[ad3delayDays] END,
     CASE @OrderBy WHEN 'ad3delayDays DESC' THEN [TOS_CLPDataDetails].[ad3delayDays] END DESC,
     CASE @OrderBy WHEN 'ad3delayStatus' THEN [TOS_CLPDataDetails].[ad3delayStatus] END,
     CASE @OrderBy WHEN 'ad3delayStatus DESC' THEN [TOS_CLPDataDetails].[ad3delayStatus] END DESC,
     CASE @OrderBy WHEN 'ad4EndtDefined' THEN [TOS_CLPDataDetails].[ad4EndtDefined] END,
     CASE @OrderBy WHEN 'ad4EndtDefined DESC' THEN [TOS_CLPDataDetails].[ad4EndtDefined] END DESC,
     CASE @OrderBy WHEN 'ad4EndtActual' THEN [TOS_CLPDataDetails].[ad4EndtActual] END,
     CASE @OrderBy WHEN 'ad4EndtActual DESC' THEN [TOS_CLPDataDetails].[ad4EndtActual] END DESC,
     CASE @OrderBy WHEN 'ad4delayDays' THEN [TOS_CLPDataDetails].[ad4delayDays] END,
     CASE @OrderBy WHEN 'ad4delayDays DESC' THEN [TOS_CLPDataDetails].[ad4delayDays] END DESC,
     CASE @OrderBy WHEN 'ad4delayStatus' THEN [TOS_CLPDataDetails].[ad4delayStatus] END,
     CASE @OrderBy WHEN 'ad4delayStatus DESC' THEN [TOS_CLPDataDetails].[ad4delayStatus] END DESC,
     CASE @OrderBy WHEN 'TOS_CLPData1_Description' THEN [TOS_CLPData1].[Description] END,
     CASE @OrderBy WHEN 'TOS_CLPData1_Description DESC' THEN [TOS_CLPData1].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_CLPs2_CLPID' THEN [TOS_CLPs2].[CLPID] END,
     CASE @OrderBy WHEN 'TOS_CLPs2_CLPID DESC' THEN [TOS_CLPs2].[CLPID] END DESC,
     CASE @OrderBy WHEN 'TOS_Projects3_Description' THEN [TOS_Projects3].[Description] END,
     CASE @OrderBy WHEN 'TOS_Projects3_Description DESC' THEN [TOS_Projects3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPDataDetails].[ProjectID] ,
		[TOS_CLPDataDetails].[ProgressID] ,
		[TOS_CLPDataDetails].[CLPID] ,
		[TOS_CLPDataDetails].[Description] ,
		[TOS_CLPDataDetails].[Quantity] ,
		[TOS_CLPDataDetails].[Sequence] ,
		[TOS_CLPDataDetails].[DisplayType] ,
		[TOS_CLPDataDetails].[engEndtDefined] ,
		[TOS_CLPDataDetails].[engEndtActual] ,
		[TOS_CLPDataDetails].[engdelayDays] ,
		[TOS_CLPDataDetails].[engdelayStatus] ,
		[TOS_CLPDataDetails].[ordEndtDefined] ,
		[TOS_CLPDataDetails].[ordEndtActual] ,
		[TOS_CLPDataDetails].[orddelayDays] ,
		[TOS_CLPDataDetails].[orddelayStatus] ,
		[TOS_CLPDataDetails].[desEndtDefined] ,
		[TOS_CLPDataDetails].[desEndtActual] ,
		[TOS_CLPDataDetails].[desdelayDays] ,
		[TOS_CLPDataDetails].[desdelayStatus] ,
		[TOS_CLPDataDetails].[ereEndtDefined] ,
		[TOS_CLPDataDetails].[ereEndtActual] ,
		[TOS_CLPDataDetails].[eredelayDays] ,
		[TOS_CLPDataDetails].[eredelayStatus] ,
		[TOS_CLPDataDetails].[ioEndtDefined] ,
		[TOS_CLPDataDetails].[ioEndtActual] ,
		[TOS_CLPDataDetails].[iodelayDays] ,
		[TOS_CLPDataDetails].[iodelayStatus] ,
		[TOS_CLPDataDetails].[recEndtDefined] ,
		[TOS_CLPDataDetails].[recEndtActual] ,
		[TOS_CLPDataDetails].[recdelayDays] ,
		[TOS_CLPDataDetails].[recdelayStatus] ,
		[TOS_CLPDataDetails].[ad1EndtDefined] ,
		[TOS_CLPDataDetails].[ad1EndtActual] ,
		[TOS_CLPDataDetails].[ad1delayDays] ,
		[TOS_CLPDataDetails].[ad1delayStatus] ,
		[TOS_CLPDataDetails].[ad2EndtDefined] ,
		[TOS_CLPDataDetails].[ad2EndtActual] ,
		[TOS_CLPDataDetails].[ad2delayDays] ,
		[TOS_CLPDataDetails].[ad2delayStatus] ,
		[TOS_CLPDataDetails].[ad3EndtDefined] ,
		[TOS_CLPDataDetails].[ad3EndtActual] ,
		[TOS_CLPDataDetails].[ad3delayDays] ,
		[TOS_CLPDataDetails].[ad3delayStatus] ,
		[TOS_CLPDataDetails].[ad4EndtDefined] ,
		[TOS_CLPDataDetails].[ad4EndtActual] ,
		[TOS_CLPDataDetails].[ad4delayDays] ,
		[TOS_CLPDataDetails].[ad4delayStatus] ,
		[TOS_CLPData1].[Description] AS TOS_CLPData1_Description,
		[TOS_CLPs2].[CLPID] AS TOS_CLPs2_CLPID,
		[TOS_Projects3].[Description] AS TOS_Projects3_Description 
  FROM [TOS_CLPDataDetails] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPDataDetails].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPDataDetails].[ProgressID] = #PageIndex.ProgressID
          AND [TOS_CLPDataDetails].[CLPID] = #PageIndex.CLPID
  INNER JOIN [TOS_CLPData] AS [TOS_CLPData1]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData1].[ProjectID]
    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData1].[ProgressID]
  INNER JOIN [TOS_CLPs] AS [TOS_CLPs2]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs2].[ProjectID]
    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs2].[CLPID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects3]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_Projects3].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO