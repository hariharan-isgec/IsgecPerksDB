USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersInsert]
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
  @Return_SupplierID NVarChar(9) = null OUTPUT 
  AS
  INSERT [EITL_Suppliers]
  (
   [SupplierID]
  ,[SupplierName]
  ,[Address1]
  ,[Address2]
  ,[Address3]
  ,[Address4]
  ,[City]
  ,[State]
  ,[Country]
  ,[Zip]
  ,[ContactPerson]
  ,[EMailID]
  ,[ContactNo]
  )
  VALUES
  (
   UPPER(@SupplierID)
  ,@SupplierName
  ,@Address1
  ,@Address2
  ,@Address3
  ,@Address4
  ,@City
  ,@State
  ,@Country
  ,@Zip
  ,@ContactPerson
  ,@EMailID
  ,@ContactNo
  )
  SET @Return_SupplierID = @SupplierID
GO
