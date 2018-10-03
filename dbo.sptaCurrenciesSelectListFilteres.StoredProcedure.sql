USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesSelectListFilteres]
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
 ,CurrencyID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CurrencyID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Currencies].[CurrencyID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Currencies] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CurrencyID' THEN '[TA_Currencies].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_Currencies].[CurrencyID] DESC'
                        WHEN 'CurrencyName' THEN '[TA_Currencies].[CurrencyName]'
                        WHEN 'CurrencyName DESC' THEN '[TA_Currencies].[CurrencyName] DESC'
                        ELSE '[TA_Currencies].[CurrencyID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_Currencies].[CurrencyID] ,
		[TA_Currencies].[CurrencyName]  
  FROM [TA_Currencies] 
      INNER JOIN #PageIndex
          ON [TA_Currencies].[CurrencyID] = #PageIndex.CurrencyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
