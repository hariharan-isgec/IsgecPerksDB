USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusDelete]
  @Original_ClaimStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_ClaimStatus]
  WHERE
  [PRK_ClaimStatus].[ClaimStatusID] = @Original_ClaimStatusID
  SET @RowCount = @@RowCount
GO
