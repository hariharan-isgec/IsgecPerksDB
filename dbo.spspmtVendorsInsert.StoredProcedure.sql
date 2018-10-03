USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsInsert]
  @VendorID NVarChar(9),
  @Description NVarChar(50),
  @Return_VendorID NVarChar(9) = null OUTPUT
  AS
  INSERT [SPMT_Vendors]
  (
   [VendorID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@VendorID)
  ,@Description
  )
  SET @Return_VendorID = @VendorID
GO
