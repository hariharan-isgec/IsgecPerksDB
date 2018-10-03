USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeUpdate]
  @Description NVarChar(30),
  @Original_TranType NVarChar(3), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_TranType] SET 
   [Description] = @Description
  WHERE
  [TranType] = @Original_TranType
  SET @RowCount = @@RowCount
GO
