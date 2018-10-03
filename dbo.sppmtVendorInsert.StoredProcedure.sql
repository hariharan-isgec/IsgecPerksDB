USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorInsert]
  @VendorID NVarChar(9),
  @Description NVarChar(50),
  @Active Bit,
  @Return_VendorID NVarChar(9) = null OUTPUT
  AS
  INSERT [PMT_Vendor]
  (
   [VendorID]
  ,[Description]
  ,[Active]
  )
  VALUES
  (
   UPPER(@VendorID)
  ,@Description
  ,@Active
  )
  SET @Return_VendorID = @VendorID
GO
