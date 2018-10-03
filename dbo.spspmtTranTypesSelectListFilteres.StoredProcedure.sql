USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesSelectListFilteres]
  @Filter_GroupID NVarChar(6),
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
 ,TranTypeID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TranTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_TranTypes].[TranTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_TranTypes] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SYS_Groups] AS [SYS_Groups1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_TranTypes].[GroupID] = [SYS_Groups1].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_TranTypes].[GroupID] = ''' + @Filter_GroupID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TranTypeID' THEN '[SPMT_TranTypes].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_TranTypes].[TranTypeID] DESC'
                        WHEN 'Description' THEN '[SPMT_TranTypes].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_TranTypes].[Description] DESC'
                        WHEN 'GroupID' THEN '[SPMT_TranTypes].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[SPMT_TranTypes].[GroupID] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_TranTypes].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_TranTypes].[BaaNCompany] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_TranTypes].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_TranTypes].[BaaNLedger] DESC'
                        WHEN 'SYS_Groups1_Description' THEN '[SYS_Groups1].[Description]'
                        WHEN 'SYS_Groups1_Description DESC' THEN '[SYS_Groups1].[Description] DESC'
                        ELSE '[SPMT_TranTypes].[TranTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_TranTypes].* ,
    [SYS_Groups1].[Description] AS SYS_Groups1_Description 
  FROM [SPMT_TranTypes] 
      INNER JOIN #PageIndex
          ON [SPMT_TranTypes].[TranTypeID] = #PageIndex.TranTypeID
  LEFT OUTER JOIN [SYS_Groups] AS [SYS_Groups1]
    ON [SPMT_TranTypes].[GroupID] = [SYS_Groups1].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
