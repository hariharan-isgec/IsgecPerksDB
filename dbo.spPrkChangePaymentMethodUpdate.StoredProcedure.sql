USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChangePaymentMethodUpdate]
  @PaymentMethod NVarChar(20),
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [PaymentMethod] = @PaymentMethod
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
