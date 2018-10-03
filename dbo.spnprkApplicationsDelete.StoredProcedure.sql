USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkApplicationsDelete]
  @Original_ApplicationID Int,
  @Original_ClaimID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Applications]
  WHERE
  [PRK_Applications].[ApplicationID] = @Original_ApplicationID
  AND [PRK_Applications].[ClaimID] = @Original_ClaimID
  SET @RowCount = @@RowCount
GO
