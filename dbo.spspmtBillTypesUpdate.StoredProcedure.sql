USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesUpdate]
  @Original_BillType Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_BillTypes] SET 
   [Description] = @Description
  WHERE
  [BillType] = @Original_BillType
  SET @RowCount = @@RowCount
GO
