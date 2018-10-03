USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDiscardUpdate]
  @Remarks NVarChar(200),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [Remarks] = @Remarks
  ,[Discarded] = @Discarded
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
