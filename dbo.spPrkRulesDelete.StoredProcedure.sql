USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkRulesDelete]
  @Original_RuleID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Rules]
  WHERE
  [PRK_Rules].[RuleID] = @Original_RuleID
  SET @RowCount = @@RowCount
GO
