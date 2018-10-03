USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesSelectByID]
  @LoginID NVarChar(8),
  @CurrencyID NVarChar(6) 
  AS
  SELECT
		[TA_Currencies].[CurrencyID] ,
		[TA_Currencies].[CurrencyName]  
  FROM [TA_Currencies] 
  WHERE
  [TA_Currencies].[CurrencyID] = @CurrencyID
GO
