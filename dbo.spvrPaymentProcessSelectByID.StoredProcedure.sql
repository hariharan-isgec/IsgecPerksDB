USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[VR_PaymentProcess].[SerialNo] ,
		[VR_PaymentProcess].[PTRNo] ,
		[VR_PaymentProcess].[PTRDate] ,
		[VR_PaymentProcess].[PTRAmount] ,
		[VR_PaymentProcess].[PaymentReference] ,
		[VR_PaymentProcess].[ChequeNo] ,
		[VR_PaymentProcess].[ChequeDate] ,
		[VR_PaymentProcess].[ChequeAmount] ,
		[VR_PaymentProcess].[PaymentDescription] ,
		[VR_PaymentProcess].[ProcessedBy] ,
		[VR_PaymentProcess].[ProcessedOn] ,
		[VR_PaymentProcess].[Freezed] ,
		[VR_PaymentProcess].[IRNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [VR_PaymentProcess] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_PaymentProcess].[ProcessedBy] = [aspnet_Users1].[LoginID]
  WHERE
  [VR_PaymentProcess].[SerialNo] = @SerialNo
GO
