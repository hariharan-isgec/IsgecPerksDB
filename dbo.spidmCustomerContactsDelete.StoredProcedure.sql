USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomerContactsDelete]
  @Original_CustomerID NVarChar(6),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_CustomerContacts]
  WHERE
  [IDM_CustomerContacts].[CustomerID] = @Original_CustomerID
  AND [IDM_CustomerContacts].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
