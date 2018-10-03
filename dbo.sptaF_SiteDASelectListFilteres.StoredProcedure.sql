USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDASelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_F_SiteDA].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_F_SiteDA] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_F_SiteDA].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_F_SiteDA].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'Perm_Bord_DA' THEN '[TA_F_SiteDA].[Perm_Bord_DA]'
                        WHEN 'Perm_Bord_DA DESC' THEN '[TA_F_SiteDA].[Perm_Bord_DA] DESC'
                        WHEN 'Cont_NonT_Bord_DA' THEN '[TA_F_SiteDA].[Cont_NonT_Bord_DA]'
                        WHEN 'Cont_NonT_Bord_DA DESC' THEN '[TA_F_SiteDA].[Cont_NonT_Bord_DA] DESC'
                        WHEN 'Cont_Tech_Bord_DA' THEN '[TA_F_SiteDA].[Cont_Tech_Bord_DA]'
                        WHEN 'Cont_Tech_Bord_DA DESC' THEN '[TA_F_SiteDA].[Cont_Tech_Bord_DA] DESC'
                        WHEN 'SerialNo' THEN '[TA_F_SiteDA].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_F_SiteDA].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_F_SiteDA].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_F_SiteDA].[CategoryID] DESC'
                        WHEN 'Cont_Tech_DA' THEN '[TA_F_SiteDA].[Cont_Tech_DA]'
                        WHEN 'Cont_Tech_DA DESC' THEN '[TA_F_SiteDA].[Cont_Tech_DA] DESC'
                        WHEN 'Cont_NonT_DA' THEN '[TA_F_SiteDA].[Cont_NonT_DA]'
                        WHEN 'Cont_NonT_DA DESC' THEN '[TA_F_SiteDA].[Cont_NonT_DA] DESC'
                        WHEN 'Perm_DA' THEN '[TA_F_SiteDA].[Perm_DA]'
                        WHEN 'Perm_DA DESC' THEN '[TA_F_SiteDA].[Perm_DA] DESC'
                        WHEN 'FromDate' THEN '[TA_F_SiteDA].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_F_SiteDA].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_F_SiteDA].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_F_SiteDA].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_F_SiteDA].[Active]'
                        WHEN 'Active DESC' THEN '[TA_F_SiteDA].[Active] DESC'
                        ELSE '[TA_F_SiteDA].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_F_SiteDA].[Perm_Bord_DA] ,
		[TA_F_SiteDA].[Cont_NonT_Bord_DA] ,
		[TA_F_SiteDA].[Cont_Tech_Bord_DA] ,
		[TA_F_SiteDA].[SerialNo] ,
		[TA_F_SiteDA].[CategoryID] ,
		[TA_F_SiteDA].[Cont_Tech_DA] ,
		[TA_F_SiteDA].[Cont_NonT_DA] ,
		[TA_F_SiteDA].[Perm_DA] ,
		[TA_F_SiteDA].[FromDate] ,
		[TA_F_SiteDA].[TillDate] ,
		[TA_F_SiteDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_F_SiteDA] 
      INNER JOIN #PageIndex
          ON [TA_F_SiteDA].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_SiteDA].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
