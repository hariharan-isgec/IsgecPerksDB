USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_Currencies].[CurrencyID] ,
		[TA_Currencies].[CurrencyName]  
  FROM [TA_Currencies] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_Currencies].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_Currencies].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'CurrencyName' THEN [TA_Currencies].[CurrencyName] END,
     CASE @OrderBy WHEN 'CurrencyName DESC' THEN [TA_Currencies].[CurrencyName] END DESC 
  SET @RecordCount = @@RowCount
GO
