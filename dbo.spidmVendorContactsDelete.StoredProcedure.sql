USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorContactsDelete]
  @Original_VendorID NVarChar(6),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_VendorContacts]
  WHERE
  [IDM_VendorContacts].[VendorID] = @Original_VendorID
  AND [IDM_VendorContacts].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
