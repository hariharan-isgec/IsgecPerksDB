USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierUpdate]
  @Original_SupplierID NVarChar(9), 
  @SupplierID NVarChar(9),
  @SupplierName NVarChar(100),
  @BankName NVarChar(50),
  @BranchAddress NVarChar(200),
  @BankAccountNo NVarChar(15),
  @IFSCCode NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PSF_Supplier] SET 
   [SupplierID] = @SupplierID
  ,[SupplierName] = @SupplierName
  ,[BankName] = @BankName
  ,[BranchAddress] = @BranchAddress
  ,[BankAccountNo] = @BankAccountNo
  ,[IFSCCode] = @IFSCCode
  WHERE
  [SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
