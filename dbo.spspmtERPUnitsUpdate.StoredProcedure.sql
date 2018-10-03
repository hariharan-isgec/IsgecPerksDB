USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsUpdate]
  @Original_UOM NVarChar(3), 
  @UOM NVarChar(3),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ERPUnits] SET 
   [UOM] = @UOM
  ,[Description] = @Description
  WHERE
  [UOM] = @Original_UOM
  SET @RowCount = @@RowCount
GO
