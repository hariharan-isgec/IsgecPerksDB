USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersUpdate]
  @Original_SupplierID NVarChar(9), 
  @SupplierID NVarChar(9),
  @SupplierName NVarChar(100),
  @Address1 NVarChar(50),
  @Address2 NVarChar(50),
  @Address3 NVarChar(50),
  @Address4 NVarChar(50),
  @City NVarChar(50),
  @State NVarChar(50),
  @Country NVarChar(50),
  @Zip NVarChar(10),
  @ContactPerson NVarChar(100),
  @EMailID NVarChar(100),
  @ContactNo NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_Suppliers] SET 
   [SupplierID] = @SupplierID
  ,[SupplierName] = @SupplierName
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[City] = @City
  ,[State] = @State
  ,[Country] = @Country
  ,[Zip] = @Zip
  ,[ContactPerson] = @ContactPerson
  ,[EMailID] = @EMailID
  ,[ContactNo] = @ContactNo
  WHERE
  [SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
