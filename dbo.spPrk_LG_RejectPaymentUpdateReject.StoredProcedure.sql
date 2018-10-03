USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrk_LG_RejectPaymentUpdateReject]
  @UpdatedInLedger Bit,
  @UpdatedOn DateTime,
  @UpdatedBy Int,
  @StatusID Int,
  @FinYear Int,
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [UpdatedInLedger] = @UpdatedInLedger
  ,[UpdatedOn] = @UpdatedOn
  ,[UpdatedBy] = @UpdatedBy
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
