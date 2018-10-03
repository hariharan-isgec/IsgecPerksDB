USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_DriverSelectListFilteres]
  @Filter_CategoryID Int,
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_D_Driver].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_Driver] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_Driver].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_Driver].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_Driver].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_Driver].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_D_Driver].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_D_Driver].[CategoryID] DESC'
                        WHEN 'DriverAmount' THEN '[TA_D_Driver].[DriverAmount]'
                        WHEN 'DriverAmount DESC' THEN '[TA_D_Driver].[DriverAmount] DESC'
                        WHEN 'FromDate' THEN '[TA_D_Driver].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_Driver].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_Driver].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_Driver].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_Driver].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_Driver].[Active] DESC'
                        ELSE '[TA_D_Driver].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Driver].[SerialNo] ,
		[TA_D_Driver].[CategoryID] ,
		[TA_D_Driver].[DriverAmount] ,
		[TA_D_Driver].[FromDate] ,
		[TA_D_Driver].[TillDate] ,
		[TA_D_Driver].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_D_Driver] 
      INNER JOIN #PageIndex
          ON [TA_D_Driver].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Driver].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
