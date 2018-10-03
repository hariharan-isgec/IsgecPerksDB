USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesUpdate]
  @Original_ChargeTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_ChargeTypes] SET 
   [Description] = @Description
  WHERE
  [ChargeTypeID] = @Original_ChargeTypeID
  SET @RowCount = @@RowCount
GO
