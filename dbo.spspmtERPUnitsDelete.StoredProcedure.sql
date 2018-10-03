USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsDelete]
  @Original_UOM NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ERPUnits]
  WHERE
  [SPMT_ERPUnits].[UOM] = @Original_UOM
  SET @RowCount = @@RowCount
GO
