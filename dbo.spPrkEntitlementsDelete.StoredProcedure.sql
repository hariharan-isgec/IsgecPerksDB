USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkEntitlementsDelete]
  @Original_EntitlementID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Entitlements]
  WHERE
  [PRK_Entitlements].[EntitlementID] = @Original_EntitlementID
  SET @RowCount = @@RowCount
GO
