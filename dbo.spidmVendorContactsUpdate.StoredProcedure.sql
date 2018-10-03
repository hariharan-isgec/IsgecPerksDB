USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorContactsUpdate]
  @Original_VendorID NVarChar(6), 
  @Original_SerialNo Int, 
  @VendorID NVarChar(6),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @Remarks NVarChar(250),
  @CCEmailID NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_VendorContacts] SET 
   [VendorID] = @VendorID
  ,[ContactPerson] = @ContactPerson
  ,[EmailID] = @EmailID
  ,[ContactNo] = @ContactNo
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[Remarks] = @Remarks
  ,[CCEmailID] = @CCEmailID
  WHERE
  [VendorID] = @Original_VendorID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
