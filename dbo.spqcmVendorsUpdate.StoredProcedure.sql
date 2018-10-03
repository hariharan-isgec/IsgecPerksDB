USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmVendorsUpdate]
  @Original_VendorID NVarChar(9), 
  @VendorID NVarChar(9),
  @Description NVarChar(50),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Vendors] SET 
   [VendorID] = @VendorID
  ,[Description] = @Description
  ,[ContactPerson] = @ContactPerson
  ,[EmailID] = @EmailID
  ,[ContactNo] = @ContactNo
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[ToEMailID] = @ToEMailID
  ,[CCEmailID] = @CCEmailID
  WHERE
  [VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
