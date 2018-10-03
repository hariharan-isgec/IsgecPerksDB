USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_ProgressID Int,
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
 ,ProjectID NVarChar(6) NOT NULL
 ,ProgressID Int NOT NULL
 ,CLPID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', ProgressID'
  SET @LGSQL = @LGSQL + ', CLPID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_CLPDataDetails].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOS_CLPDataDetails].[ProgressID]'
  SET @LGSQL = @LGSQL + ', [TOS_CLPDataDetails].[CLPID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_CLPDataDetails] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_CLPData] AS [TOS_CLPData1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData1].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData1].[ProgressID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_CLPs] AS [TOS_CLPs2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs2].[CLPID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Projects] AS [TOS_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPDataDetails].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_ProgressID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPDataDetails].[ProgressID] = ' + STR(@Filter_ProgressID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_CLPDataDetails].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_CLPDataDetails].[ProjectID] DESC'
                        WHEN 'ProgressID' THEN '[TOS_CLPDataDetails].[ProgressID]'
                        WHEN 'ProgressID DESC' THEN '[TOS_CLPDataDetails].[ProgressID] DESC'
                        WHEN 'CLPID' THEN '[TOS_CLPDataDetails].[CLPID]'
                        WHEN 'CLPID DESC' THEN '[TOS_CLPDataDetails].[CLPID] DESC'
                        WHEN 'Description' THEN '[TOS_CLPDataDetails].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_CLPDataDetails].[Description] DESC'
                        WHEN 'Quantity' THEN '[TOS_CLPDataDetails].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[TOS_CLPDataDetails].[Quantity] DESC'
                        WHEN 'Sequence' THEN '[TOS_CLPDataDetails].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TOS_CLPDataDetails].[Sequence] DESC'
                        WHEN 'DisplayType' THEN '[TOS_CLPDataDetails].[DisplayType]'
                        WHEN 'DisplayType DESC' THEN '[TOS_CLPDataDetails].[DisplayType] DESC'
                        WHEN 'engEndtDefined' THEN '[TOS_CLPDataDetails].[engEndtDefined]'
                        WHEN 'engEndtDefined DESC' THEN '[TOS_CLPDataDetails].[engEndtDefined] DESC'
                        WHEN 'engEndtActual' THEN '[TOS_CLPDataDetails].[engEndtActual]'
                        WHEN 'engEndtActual DESC' THEN '[TOS_CLPDataDetails].[engEndtActual] DESC'
                        WHEN 'engdelayDays' THEN '[TOS_CLPDataDetails].[engdelayDays]'
                        WHEN 'engdelayDays DESC' THEN '[TOS_CLPDataDetails].[engdelayDays] DESC'
                        WHEN 'engdelayStatus' THEN '[TOS_CLPDataDetails].[engdelayStatus]'
                        WHEN 'engdelayStatus DESC' THEN '[TOS_CLPDataDetails].[engdelayStatus] DESC'
                        WHEN 'ordEndtDefined' THEN '[TOS_CLPDataDetails].[ordEndtDefined]'
                        WHEN 'ordEndtDefined DESC' THEN '[TOS_CLPDataDetails].[ordEndtDefined] DESC'
                        WHEN 'ordEndtActual' THEN '[TOS_CLPDataDetails].[ordEndtActual]'
                        WHEN 'ordEndtActual DESC' THEN '[TOS_CLPDataDetails].[ordEndtActual] DESC'
                        WHEN 'orddelayDays' THEN '[TOS_CLPDataDetails].[orddelayDays]'
                        WHEN 'orddelayDays DESC' THEN '[TOS_CLPDataDetails].[orddelayDays] DESC'
                        WHEN 'orddelayStatus' THEN '[TOS_CLPDataDetails].[orddelayStatus]'
                        WHEN 'orddelayStatus DESC' THEN '[TOS_CLPDataDetails].[orddelayStatus] DESC'
                        WHEN 'desEndtDefined' THEN '[TOS_CLPDataDetails].[desEndtDefined]'
                        WHEN 'desEndtDefined DESC' THEN '[TOS_CLPDataDetails].[desEndtDefined] DESC'
                        WHEN 'desEndtActual' THEN '[TOS_CLPDataDetails].[desEndtActual]'
                        WHEN 'desEndtActual DESC' THEN '[TOS_CLPDataDetails].[desEndtActual] DESC'
                        WHEN 'desdelayDays' THEN '[TOS_CLPDataDetails].[desdelayDays]'
                        WHEN 'desdelayDays DESC' THEN '[TOS_CLPDataDetails].[desdelayDays] DESC'
                        WHEN 'desdelayStatus' THEN '[TOS_CLPDataDetails].[desdelayStatus]'
                        WHEN 'desdelayStatus DESC' THEN '[TOS_CLPDataDetails].[desdelayStatus] DESC'
                        WHEN 'ereEndtDefined' THEN '[TOS_CLPDataDetails].[ereEndtDefined]'
                        WHEN 'ereEndtDefined DESC' THEN '[TOS_CLPDataDetails].[ereEndtDefined] DESC'
                        WHEN 'ereEndtActual' THEN '[TOS_CLPDataDetails].[ereEndtActual]'
                        WHEN 'ereEndtActual DESC' THEN '[TOS_CLPDataDetails].[ereEndtActual] DESC'
                        WHEN 'eredelayDays' THEN '[TOS_CLPDataDetails].[eredelayDays]'
                        WHEN 'eredelayDays DESC' THEN '[TOS_CLPDataDetails].[eredelayDays] DESC'
                        WHEN 'eredelayStatus' THEN '[TOS_CLPDataDetails].[eredelayStatus]'
                        WHEN 'eredelayStatus DESC' THEN '[TOS_CLPDataDetails].[eredelayStatus] DESC'
                        WHEN 'ioEndtDefined' THEN '[TOS_CLPDataDetails].[ioEndtDefined]'
                        WHEN 'ioEndtDefined DESC' THEN '[TOS_CLPDataDetails].[ioEndtDefined] DESC'
                        WHEN 'ioEndtActual' THEN '[TOS_CLPDataDetails].[ioEndtActual]'
                        WHEN 'ioEndtActual DESC' THEN '[TOS_CLPDataDetails].[ioEndtActual] DESC'
                        WHEN 'iodelayDays' THEN '[TOS_CLPDataDetails].[iodelayDays]'
                        WHEN 'iodelayDays DESC' THEN '[TOS_CLPDataDetails].[iodelayDays] DESC'
                        WHEN 'iodelayStatus' THEN '[TOS_CLPDataDetails].[iodelayStatus]'
                        WHEN 'iodelayStatus DESC' THEN '[TOS_CLPDataDetails].[iodelayStatus] DESC'
                        WHEN 'recEndtDefined' THEN '[TOS_CLPDataDetails].[recEndtDefined]'
                        WHEN 'recEndtDefined DESC' THEN '[TOS_CLPDataDetails].[recEndtDefined] DESC'
                        WHEN 'recEndtActual' THEN '[TOS_CLPDataDetails].[recEndtActual]'
                        WHEN 'recEndtActual DESC' THEN '[TOS_CLPDataDetails].[recEndtActual] DESC'
                        WHEN 'recdelayDays' THEN '[TOS_CLPDataDetails].[recdelayDays]'
                        WHEN 'recdelayDays DESC' THEN '[TOS_CLPDataDetails].[recdelayDays] DESC'
                        WHEN 'recdelayStatus' THEN '[TOS_CLPDataDetails].[recdelayStatus]'
                        WHEN 'recdelayStatus DESC' THEN '[TOS_CLPDataDetails].[recdelayStatus] DESC'
                        WHEN 'ad1EndtDefined' THEN '[TOS_CLPDataDetails].[ad1EndtDefined]'
                        WHEN 'ad1EndtDefined DESC' THEN '[TOS_CLPDataDetails].[ad1EndtDefined] DESC'
                        WHEN 'ad1EndtActual' THEN '[TOS_CLPDataDetails].[ad1EndtActual]'
                        WHEN 'ad1EndtActual DESC' THEN '[TOS_CLPDataDetails].[ad1EndtActual] DESC'
                        WHEN 'ad1delayDays' THEN '[TOS_CLPDataDetails].[ad1delayDays]'
                        WHEN 'ad1delayDays DESC' THEN '[TOS_CLPDataDetails].[ad1delayDays] DESC'
                        WHEN 'ad1delayStatus' THEN '[TOS_CLPDataDetails].[ad1delayStatus]'
                        WHEN 'ad1delayStatus DESC' THEN '[TOS_CLPDataDetails].[ad1delayStatus] DESC'
                        WHEN 'ad2EndtDefined' THEN '[TOS_CLPDataDetails].[ad2EndtDefined]'
                        WHEN 'ad2EndtDefined DESC' THEN '[TOS_CLPDataDetails].[ad2EndtDefined] DESC'
                        WHEN 'ad2EndtActual' THEN '[TOS_CLPDataDetails].[ad2EndtActual]'
                        WHEN 'ad2EndtActual DESC' THEN '[TOS_CLPDataDetails].[ad2EndtActual] DESC'
                        WHEN 'ad2delayDays' THEN '[TOS_CLPDataDetails].[ad2delayDays]'
                        WHEN 'ad2delayDays DESC' THEN '[TOS_CLPDataDetails].[ad2delayDays] DESC'
                        WHEN 'ad2delayStatus' THEN '[TOS_CLPDataDetails].[ad2delayStatus]'
                        WHEN 'ad2delayStatus DESC' THEN '[TOS_CLPDataDetails].[ad2delayStatus] DESC'
                        WHEN 'ad3EndtDefined' THEN '[TOS_CLPDataDetails].[ad3EndtDefined]'
                        WHEN 'ad3EndtDefined DESC' THEN '[TOS_CLPDataDetails].[ad3EndtDefined] DESC'
                        WHEN 'ad3EndtActual' THEN '[TOS_CLPDataDetails].[ad3EndtActual]'
                        WHEN 'ad3EndtActual DESC' THEN '[TOS_CLPDataDetails].[ad3EndtActual] DESC'
                        WHEN 'ad3delayDays' THEN '[TOS_CLPDataDetails].[ad3delayDays]'
                        WHEN 'ad3delayDays DESC' THEN '[TOS_CLPDataDetails].[ad3delayDays] DESC'
                        WHEN 'ad3delayStatus' THEN '[TOS_CLPDataDetails].[ad3delayStatus]'
                        WHEN 'ad3delayStatus DESC' THEN '[TOS_CLPDataDetails].[ad3delayStatus] DESC'
                        WHEN 'ad4EndtDefined' THEN '[TOS_CLPDataDetails].[ad4EndtDefined]'
                        WHEN 'ad4EndtDefined DESC' THEN '[TOS_CLPDataDetails].[ad4EndtDefined] DESC'
                        WHEN 'ad4EndtActual' THEN '[TOS_CLPDataDetails].[ad4EndtActual]'
                        WHEN 'ad4EndtActual DESC' THEN '[TOS_CLPDataDetails].[ad4EndtActual] DESC'
                        WHEN 'ad4delayDays' THEN '[TOS_CLPDataDetails].[ad4delayDays]'
                        WHEN 'ad4delayDays DESC' THEN '[TOS_CLPDataDetails].[ad4delayDays] DESC'
                        WHEN 'ad4delayStatus' THEN '[TOS_CLPDataDetails].[ad4delayStatus]'
                        WHEN 'ad4delayStatus DESC' THEN '[TOS_CLPDataDetails].[ad4delayStatus] DESC'
                        WHEN 'TOS_CLPData1_Description' THEN '[TOS_CLPData1].[Description]'
                        WHEN 'TOS_CLPData1_Description DESC' THEN '[TOS_CLPData1].[Description] DESC'
                        WHEN 'TOS_CLPs2_CLPID' THEN '[TOS_CLPs2].[CLPID]'
                        WHEN 'TOS_CLPs2_CLPID DESC' THEN '[TOS_CLPs2].[CLPID] DESC'
                        WHEN 'TOS_Projects3_Description' THEN '[TOS_Projects3].[Description]'
                        WHEN 'TOS_Projects3_Description DESC' THEN '[TOS_Projects3].[Description] DESC'
                        ELSE '[TOS_CLPDataDetails].[ProjectID],[TOS_CLPDataDetails].[ProgressID],[TOS_CLPDataDetails].[CLPID]'
                    END
  EXEC (@LGSQL)

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
