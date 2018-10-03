USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesUpdate]
  @Original_BillType Int, 
  @Original_HSNSACCode NVarChar(20), 
  @BillType Int,
  @HSNSACCode NVarChar(20),
  @Description NVarChar(500),
  @TaxRate Decimal(18,6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_HSNSACCodes] SET 
   [BillType] = @BillType
  ,[HSNSACCode] = @HSNSACCode
  ,[Description] = @Description
  ,[TaxRate] = @TaxRate
  WHERE
  [BillType] = @Original_BillType
  AND [HSNSACCode] = @Original_HSNSACCode
  SET @RowCount = @@RowCount
GO
