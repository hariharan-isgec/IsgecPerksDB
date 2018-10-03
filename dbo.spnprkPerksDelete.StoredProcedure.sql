USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPerksDelete]
  @Original_PerkID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Perks]
  WHERE
  [PRK_Perks].[PerkID] = @Original_PerkID
  SET @RowCount = @@RowCount
GO
