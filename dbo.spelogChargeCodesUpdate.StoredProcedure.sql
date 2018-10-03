USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesUpdate]
  @Original_ChargeCategoryID Int, 
  @Original_ChargeCodeID Int, 
  @ChargeCategoryID Int,
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_ChargeCodes] SET 
   [ChargeCategoryID] = @ChargeCategoryID
  ,[Description] = @Description
  WHERE
  [ChargeCategoryID] = @Original_ChargeCategoryID
  AND [ChargeCodeID] = @Original_ChargeCodeID
  SET @RowCount = @@RowCount
GO
