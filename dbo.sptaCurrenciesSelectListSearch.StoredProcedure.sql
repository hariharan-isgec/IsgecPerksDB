USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesSelectListSearch]
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
 ,CurrencyID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (CurrencyID)
  SELECT [TA_Currencies].[CurrencyID] FROM [TA_Currencies]
 WHERE  
   ( 
         LOWER(ISNULL([TA_Currencies].[CurrencyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Currencies].[CurrencyName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_Currencies].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_Currencies].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'CurrencyName' THEN [TA_Currencies].[CurrencyName] END,
     CASE @OrderBy WHEN 'CurrencyName DESC' THEN [TA_Currencies].[CurrencyName] END DESC 

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
