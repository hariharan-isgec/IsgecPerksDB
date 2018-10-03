USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillAmountDelete]
  @Original_TABillNo Int,
  @Original_ComponentID Int,
  @Original_CurrencyID NVarChar(6),
  @Original_CostCenterID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillAmount]
  WHERE
  [TA_BillAmount].[TABillNo] = @Original_TABillNo
  AND [TA_BillAmount].[ComponentID] = @Original_ComponentID
  AND [TA_BillAmount].[CurrencyID] = @Original_CurrencyID
  AND [TA_BillAmount].[CostCenterID] = @Original_CostCenterID
  SET @RowCount = @@RowCount
GO
