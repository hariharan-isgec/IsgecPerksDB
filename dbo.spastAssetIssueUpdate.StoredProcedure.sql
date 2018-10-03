USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetIssueUpdate]
  @Remarks NVarChar(100),
  @LocationID Int,
  @UserID Int,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_AssetID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetDetails] SET 
   [Remarks] = @Remarks
  ,[LocationID] = @LocationID
  ,[UserID] = @UserID
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
