USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstDiscardUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
  @Discarded Bit,
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ModificationRemarks NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
   [Discarded] = @Discarded
  ,[Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[ModificationRemarks] = @ModificationRemarks
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
