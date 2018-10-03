USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsUpdate]
  @Description NVarChar(50),
  @Original_RamID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_Rams] SET 
   [Description] = @Description
  WHERE
  [RamID] = @Original_RamID
  SET @RowCount = @@RowCount
GO
