USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmVendorsDelete]
  @Original_VendorID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Vendors]
  WHERE
  [IDM_Vendors].[VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
