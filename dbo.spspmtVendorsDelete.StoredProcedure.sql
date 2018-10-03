USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsDelete]
  @Original_VendorID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_Vendors]
  WHERE
  [SPMT_Vendors].[VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
