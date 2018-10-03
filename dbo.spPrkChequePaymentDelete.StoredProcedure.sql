USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChequePaymentDelete]
  @Original_ApplicationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Applications]
  WHERE
  [PRK_Applications].[ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
