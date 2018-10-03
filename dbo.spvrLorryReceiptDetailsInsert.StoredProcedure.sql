USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsInsert]
  @GRorLRNo NVarChar(50),
  @GRorLRDate DateTime,
  @SupplierID NVarChar(9),
  @SupplierInvoiceNo NVarChar(50),
  @SupplierInvoiceDate DateTime,
  @WeightAsPerInvoiceInKG Int,
  @WeightReceived Int,
  @MaterialForm NVarChar(10),
  @NoOfPackagesAsPerInvoice Int,
  @NoOfPackagesReceived Int,
  @CenvatInvoiceReceived NVarChar(10),
  @Remarks NVarChar(150),
  @ProjectID NVarChar(6),
  @MRNNo Int,
  @SupplierName NVarChar(50),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_MRNNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_LorryReceiptDetails]
  (
   [GRorLRNo]
  ,[GRorLRDate]
  ,[SupplierID]
  ,[SupplierInvoiceNo]
  ,[SupplierInvoiceDate]
  ,[WeightAsPerInvoiceInKG]
  ,[WeightReceived]
  ,[MaterialForm]
  ,[NoOfPackagesAsPerInvoice]
  ,[NoOfPackagesReceived]
  ,[CenvatInvoiceReceived]
  ,[Remarks]
  ,[ProjectID]
  ,[MRNNo]
  ,[SupplierName]
  )
  VALUES
  (
   @GRorLRNo
  ,@GRorLRDate
  ,@SupplierID
  ,@SupplierInvoiceNo
  ,@SupplierInvoiceDate
  ,@WeightAsPerInvoiceInKG
  ,@WeightReceived
  ,@MaterialForm
  ,@NoOfPackagesAsPerInvoice
  ,@NoOfPackagesReceived
  ,@CenvatInvoiceReceived
  ,@Remarks
  ,UPPER(@ProjectID)
  ,@MRNNo
  ,@SupplierName
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_MRNNo = @MRNNo
  SET @Return_SerialNo = Scope_Identity()
GO
