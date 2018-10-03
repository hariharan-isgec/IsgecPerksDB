USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusUpdate]
  @Original_BillStatusID Int, 
  @Description NVarChar(30),
  @NextStatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_BillStatus] SET 
   [Description] = @Description
  ,[NextStatusID] = @NextStatusID
  WHERE
  [BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO
