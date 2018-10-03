USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesDelete]
  @Original_CurrencyID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Currencies]
  WHERE
  [TA_Currencies].[CurrencyID] = @Original_CurrencyID
  SET @RowCount = @@RowCount
GO
