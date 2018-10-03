USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierInsert]
  @SupplierID NVarChar(9),
  @SupplierName NVarChar(100),
  @BankName NVarChar(50),
  @BranchAddress NVarChar(200),
  @BankAccountNo NVarChar(15),
  @IFSCCode NVarChar(15),
  @Return_SupplierID NVarChar(9) = null OUTPUT 
  AS
  INSERT [PSF_Supplier]
  (
   [SupplierID]
  ,[SupplierName]
  ,[BankName]
  ,[BranchAddress]
  ,[BankAccountNo]
  ,[IFSCCode]
  )
  VALUES
  (
   UPPER(@SupplierID)
  ,@SupplierName
  ,@BankName
  ,@BranchAddress
  ,@BankAccountNo
  ,@IFSCCode
  )
  SET @Return_SupplierID = @SupplierID
GO
