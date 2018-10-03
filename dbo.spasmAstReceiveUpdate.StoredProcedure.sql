USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstReceiveUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
  @UserID NVarChar(8),
  @LocationID NVarChar(20),
  @StandBy Bit,
  @ReplacedTill DateTime,
  @Issued Bit,
  @ModificationRemarks NVarChar(50),
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
   [UserID] = @UserID
  ,[LocationID] = @LocationID
  ,[StandBy] = @StandBy
  ,[ReplacedTill] = @ReplacedTill
  ,[Issued] = @Issued
  ,[ModificationRemarks] = @ModificationRemarks
  ,[Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
