USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsUpdate]
  @Original_VendorID NVarChar(9), 
  @VendorID NVarChar(9),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_Vendors] SET 
   [VendorID] = @VendorID
  ,[Description] = @Description
  WHERE
  [VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
