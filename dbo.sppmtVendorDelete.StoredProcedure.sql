USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorDelete]
  @Original_VendorID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_Vendor]
  WHERE
  [PMT_Vendor].[VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
