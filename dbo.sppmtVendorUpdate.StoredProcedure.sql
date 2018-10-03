USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorUpdate]
  @Original_VendorID NVarChar(9), 
  @Description NVarChar(50),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_Vendor] SET 
   [Description] = @Description
  ,[Active] = @Active
  WHERE
  [VendorID] = @Original_VendorID
  SET @RowCount = @@RowCount
GO
