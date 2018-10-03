USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedPCUpdate]
  @Discarded Bit,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [Discarded] = @Discarded
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
