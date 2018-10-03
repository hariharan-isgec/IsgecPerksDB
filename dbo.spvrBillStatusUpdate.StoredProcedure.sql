USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusUpdate]
  @Original_BillStatusID Int, 
  @BillStatusID Int,
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_BillStatus] SET 
   [BillStatusID] = @BillStatusID
  ,[Description] = @Description
  WHERE
  [BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO
