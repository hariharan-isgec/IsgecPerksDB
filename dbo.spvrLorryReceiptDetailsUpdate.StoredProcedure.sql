USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_MRNNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_LorryReceiptDetails] SET 
   [GRorLRNo] = @GRorLRNo
  ,[GRorLRDate] = @GRorLRDate
  ,[SupplierID] = @SupplierID
  ,[SupplierInvoiceNo] = @SupplierInvoiceNo
  ,[SupplierInvoiceDate] = @SupplierInvoiceDate
  ,[WeightAsPerInvoiceInKG] = @WeightAsPerInvoiceInKG
  ,[WeightReceived] = @WeightReceived
  ,[MaterialForm] = @MaterialForm
  ,[NoOfPackagesAsPerInvoice] = @NoOfPackagesAsPerInvoice
  ,[NoOfPackagesReceived] = @NoOfPackagesReceived
  ,[CenvatInvoiceReceived] = @CenvatInvoiceReceived
  ,[Remarks] = @Remarks
  ,[ProjectID] = @ProjectID
  ,[MRNNo] = @MRNNo
  ,[SupplierName] = @SupplierName
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [MRNNo] = @Original_MRNNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
