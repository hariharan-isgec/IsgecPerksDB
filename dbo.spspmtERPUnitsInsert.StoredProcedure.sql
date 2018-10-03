USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsInsert]
  @UOM NVarChar(3),
  @Description NVarChar(50),
  @Return_UOM NVarChar(3) = null OUTPUT 
  AS
  INSERT [SPMT_ERPUnits]
  (
   [UOM]
  ,[Description]
  )
  VALUES
  (
   UPPER(@UOM)
  ,@Description
  )
  SET @Return_UOM = @UOM
GO
