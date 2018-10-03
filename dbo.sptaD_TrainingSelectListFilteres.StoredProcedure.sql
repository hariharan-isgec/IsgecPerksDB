USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TrainingSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_D_Training].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_Training] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_Training].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_Training].[SerialNo] DESC'
                        WHEN 'Bord_Lodg_DA_Percent' THEN '[TA_D_Training].[Bord_Lodg_DA_Percent]'
                        WHEN 'Bord_Lodg_DA_Percent DESC' THEN '[TA_D_Training].[Bord_Lodg_DA_Percent] DESC'
                        WHEN 'Lodg_DA_Percent' THEN '[TA_D_Training].[Lodg_DA_Percent]'
                        WHEN 'Lodg_DA_Percent DESC' THEN '[TA_D_Training].[Lodg_DA_Percent] DESC'
                        WHEN 'FromDate' THEN '[TA_D_Training].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_Training].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_Training].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_Training].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_Training].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_Training].[Active] DESC'
                        ELSE '[TA_D_Training].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Training].[SerialNo] ,
		[TA_D_Training].[Bord_Lodg_DA_Percent] ,
		[TA_D_Training].[Lodg_DA_Percent] ,
		[TA_D_Training].[FromDate] ,
		[TA_D_Training].[TillDate] ,
		[TA_D_Training].[Active]  
  FROM [TA_D_Training] 
      INNER JOIN #PageIndex
          ON [TA_D_Training].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
