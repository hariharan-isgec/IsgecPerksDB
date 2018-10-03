USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_ForeignTravelSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_F_ForeignTravel].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_F_ForeignTravel] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_F_ForeignTravel].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_F_ForeignTravel].[SerialNo] DESC'
                        WHEN 'Bord_Lodg_DA_Percent' THEN '[TA_F_ForeignTravel].[Bord_Lodg_DA_Percent]'
                        WHEN 'Bord_Lodg_DA_Percent DESC' THEN '[TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] DESC'
                        WHEN 'Lodg_DA_Percent' THEN '[TA_F_ForeignTravel].[Lodg_DA_Percent]'
                        WHEN 'Lodg_DA_Percent DESC' THEN '[TA_F_ForeignTravel].[Lodg_DA_Percent] DESC'
                        WHEN 'DA_Adjested_LC_Percent' THEN '[TA_F_ForeignTravel].[DA_Adjested_LC_Percent]'
                        WHEN 'DA_Adjested_LC_Percent DESC' THEN '[TA_F_ForeignTravel].[DA_Adjested_LC_Percent] DESC'
                        WHEN 'FromDate' THEN '[TA_F_ForeignTravel].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_F_ForeignTravel].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_F_ForeignTravel].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_F_ForeignTravel].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_F_ForeignTravel].[Active]'
                        WHEN 'Active DESC' THEN '[TA_F_ForeignTravel].[Active] DESC'
                        ELSE '[TA_F_ForeignTravel].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_F_ForeignTravel].[SerialNo] ,
		[TA_F_ForeignTravel].[Bord_Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[Lodg_DA_Percent] ,
		[TA_F_ForeignTravel].[DA_Adjested_LC_Percent] ,
		[TA_F_ForeignTravel].[FromDate] ,
		[TA_F_ForeignTravel].[TillDate] ,
		[TA_F_ForeignTravel].[Active]  
  FROM [TA_F_ForeignTravel] 
      INNER JOIN #PageIndex
          ON [TA_F_ForeignTravel].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
