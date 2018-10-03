USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtChequeReceiptsInsert]
  @CQNumber NVarChar(50),
  @CQDate DateTime,
  @CQAmount Decimal(10,2),
  @VendorID NVarChar(6),
  @CQRDt DateTime,
  @StatusID Int,
  @Return_CQRNo Int = null OUTPUT
  AS
  INSERT [PMT_CQReceipts]
  (
   [CQNumber]
  ,[CQDate]
  ,[CQAmount]
  ,[VendorID]
  ,[CQRDt]
  ,[StatusID]
  )
  VALUES
  (
   @CQNumber
  ,@CQDate
  ,@CQAmount
  ,@VendorID
  ,@CQRDt
  ,@StatusID
  )
  SET @Return_CQRNo = Scope_Identity()
GO
