USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCIssueUpdate]
  @Remarks NVarChar(200),
  @LocationID Int,
  @UserID Int,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [Remarks] = @Remarks
  ,[LocationID] = @LocationID
  ,[UserID] = @UserID
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
