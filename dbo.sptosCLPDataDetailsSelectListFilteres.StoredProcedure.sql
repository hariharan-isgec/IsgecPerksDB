USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDetailsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_ProgressID Int,
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
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_CLPData] AS [TOS_CLPData3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData3].[ProgressID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_CLPs] AS [TOS_CLPs4]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs4].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs4].[CLPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPDataDetails].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_ProgressID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPDataDetails].[ProgressID] = ' + STR(@Filter_ProgressID)
  SET @LGSQL = @LGSQL + '  ORDER BY [TOS_CLPs4].[Sequence] '


  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPDataDetails].[ProjectID] ,
		[TOS_CLPDataDetails].[ProgressID] ,
		[TOS_CLPDataDetails].[CLPID] ,
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
		[TOS_CLPDataDetails].[engRemarks] ,
		[TOS_CLPDataDetails].[ordRemarks] ,
		[TOS_CLPDataDetails].[desRemarks] ,
		[TOS_CLPDataDetails].[momBy] ,
		[TOS_CLPDataDetails].[momOn] ,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[TOS_CLPData3].[Description] AS TOS_CLPData3_Description,
		[TOS_CLPs4].[Description] AS TOS_CLPs4_Description 
  FROM [TOS_CLPDataDetails] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPDataDetails].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPDataDetails].[ProgressID] = #PageIndex.ProgressID
          AND [TOS_CLPDataDetails].[CLPID] = #PageIndex.CLPID
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_CLPDataDetails].[ProjectID] = [IDM_Projects2].[ProjectID]
  INNER JOIN [TOS_CLPData] AS [TOS_CLPData3]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData3].[ProjectID]
    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData3].[ProgressID]
  INNER JOIN [TOS_CLPs] AS [TOS_CLPs4]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs4].[ProjectID]
    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs4].[CLPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
