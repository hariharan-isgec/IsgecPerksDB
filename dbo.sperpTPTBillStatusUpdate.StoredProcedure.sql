USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusUpdate]
  @Original_BillStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_TPTBillStatus] SET 
   [Description] = @Description
  WHERE
  [BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO
