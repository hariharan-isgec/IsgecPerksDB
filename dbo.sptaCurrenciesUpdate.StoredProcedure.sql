USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesUpdate]
  @Original_CurrencyID NVarChar(6), 
  @CurrencyID NVarChar(6),
  @CurrencyName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Currencies] SET 
   [CurrencyID] = @CurrencyID
  ,[CurrencyName] = @CurrencyName
  WHERE
  [CurrencyID] = @Original_CurrencyID
  SET @RowCount = @@RowCount
GO
