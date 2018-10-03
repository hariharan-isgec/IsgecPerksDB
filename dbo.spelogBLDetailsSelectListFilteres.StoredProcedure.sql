USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsSelectListFilteres]
  @Filter_BLID NVarChar(9),
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
 ,BLID NVarChar(9) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BLID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_BLDetails].[BLID]'
  SET @LGSQL = @LGSQL + ', [ELOG_BLDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_BLDetails] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_BLDetails].[BLID] = [ELOG_BLHeader1].[BLID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BLID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_BLDetails].[BLID] = ''' + @Filter_BLID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BLID' THEN '[ELOG_BLDetails].[BLID]'
                        WHEN 'BLID DESC' THEN '[ELOG_BLDetails].[BLID] DESC'
                        WHEN 'SerialNo' THEN '[ELOG_BLDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ELOG_BLDetails].[SerialNo] DESC'
                        WHEN 'SizeAndTypeOfContainer' THEN '[ELOG_BLDetails].[SizeAndTypeOfContainer]'
                        WHEN 'SizeAndTypeOfContainer DESC' THEN '[ELOG_BLDetails].[SizeAndTypeOfContainer] DESC'
                        WHEN 'ContainerNumber' THEN '[ELOG_BLDetails].[ContainerNumber]'
                        WHEN 'ContainerNumber DESC' THEN '[ELOG_BLDetails].[ContainerNumber] DESC'
                        WHEN 'Remarks' THEN '[ELOG_BLDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ELOG_BLDetails].[Remarks] DESC'
                        WHEN 'ELOG_BLHeader1_BLNumber' THEN '[ELOG_BLHeader1].[BLNumber]'
                        WHEN 'ELOG_BLHeader1_BLNumber DESC' THEN '[ELOG_BLHeader1].[BLNumber] DESC'
                        ELSE '[ELOG_BLDetails].[BLID],[ELOG_BLDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BLDetails].* ,
    [ELOG_BLHeader1].[BLNumber] AS ELOG_BLHeader1_BLNumber 
  FROM [ELOG_BLDetails] 
      INNER JOIN #PageIndex
          ON [ELOG_BLDetails].[BLID] = #PageIndex.BLID
          AND [ELOG_BLDetails].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader1]
    ON [ELOG_BLDetails].[BLID] = [ELOG_BLHeader1].[BLID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
