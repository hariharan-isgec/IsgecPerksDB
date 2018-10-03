USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesDelete]
  @Original_CategoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Categories]
  WHERE
  [TA_Categories].[CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
