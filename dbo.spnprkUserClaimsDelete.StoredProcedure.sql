USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsDelete]
  @Original_ClaimID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_UserClaims]
  WHERE
  [PRK_UserClaims].[ClaimID] = @Original_ClaimID
  SET @RowCount = @@RowCount
GO
