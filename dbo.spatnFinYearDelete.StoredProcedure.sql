USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnFinYearDelete]
  @Original_FinYear NVarChar(4),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_FinYear]
  WHERE
  [ATN_FinYear].[FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO
