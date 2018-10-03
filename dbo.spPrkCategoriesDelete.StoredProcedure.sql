USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCategoriesDelete]
  @Original_CategoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Categories]
  WHERE
  [PRK_Categories].[CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
