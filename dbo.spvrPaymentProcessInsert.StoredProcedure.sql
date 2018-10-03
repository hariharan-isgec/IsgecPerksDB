USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessInsert]
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
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_PaymentProcess]
  (
   [PTRNo]
  ,[PTRDate]
  ,[PTRAmount]
  ,[PaymentReference]
  ,[ChequeNo]
  ,[ChequeDate]
  ,[ChequeAmount]
  ,[PaymentDescription]
  ,[ProcessedBy]
  ,[ProcessedOn]
  ,[Freezed]
  ,[IRNo]
  )
  VALUES
  (
   @PTRNo
  ,@PTRDate
  ,@PTRAmount
  ,@PaymentReference
  ,@ChequeNo
  ,@ChequeDate
  ,@ChequeAmount
  ,@PaymentDescription
  ,@ProcessedBy
  ,@ProcessedOn
  ,@Freezed
  ,@IRNo
  )
  SET @Return_SerialNo = Scope_Identity()
GO
