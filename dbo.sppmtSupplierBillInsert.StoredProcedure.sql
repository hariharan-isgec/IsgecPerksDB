USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillInsert]
  @ReceivedOn DateTime,
  @VendorID NVarChar(6),
  @VendorBillNo NVarChar(30),
  @VendorBillDate DateTime,
  @BillDistance Decimal(10,2),
  @BillHours Decimal(10,2),
  @BillAmount Decimal(10,2),
  @PassedDistance Decimal(10,2),
  @PassedHours Decimal(10,2),
  @PassedAmount Decimal(10,2),
  @Remarks NVarChar(250),
  @BillCorrected Bit,
  @StatusID Int,
  @Return_IRNo Int = null OUTPUT
  AS
  INSERT [PMT_IRDocs]
  (
   [ReceivedOn]
  ,[VendorID]
  ,[VendorBillNo]
  ,[VendorBillDate]
  ,[BillDistance]
  ,[BillHours]
  ,[BillAmount]
  ,[PassedDistance]
  ,[PassedHours]
  ,[PassedAmount]
  ,[Remarks]
  ,[BillCorrected]
  ,[StatusID]
  )
  VALUES
  (
   @ReceivedOn
  ,@VendorID
  ,@VendorBillNo
  ,@VendorBillDate
  ,@BillDistance
  ,@BillHours
  ,@BillAmount
  ,@PassedDistance
  ,@PassedHours
  ,@PassedAmount
  ,@Remarks
  ,@BillCorrected
  ,@StatusID
  )
  SET @Return_IRNo = Scope_Identity()
GO
