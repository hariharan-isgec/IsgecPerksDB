USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessUpdate]
  @Original_SerialNo Int, 
  @PTRNo NVarChar(10),
  @PTRDate DateTime,
  @PTRAmount Decimal(18,2),
  @PaymentReference NVarChar(50),
  @ChequeNo NVarChar(10),
  @ChequeDate DateTime,
  @ChequeAmount Decimal(18,2),
  @PaymentDescription NVarChar(50),
  @ProcessedBy NVarChar(8),
  @ProcessedOn DateTime,
  @Freezed Bit,
  @IRNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_PaymentProcess] SET 
   [PTRNo] = @PTRNo
  ,[PTRDate] = @PTRDate
  ,[PTRAmount] = @PTRAmount
  ,[PaymentReference] = @PaymentReference
  ,[ChequeNo] = @ChequeNo
  ,[ChequeDate] = @ChequeDate
  ,[ChequeAmount] = @ChequeAmount
  ,[PaymentDescription] = @PaymentDescription
  ,[ProcessedBy] = @ProcessedBy
  ,[ProcessedOn] = @ProcessedOn
  ,[Freezed] = @Freezed
  ,[IRNo] = @IRNo
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
