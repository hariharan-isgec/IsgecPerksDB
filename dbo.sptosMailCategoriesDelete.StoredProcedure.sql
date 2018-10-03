USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesDelete]
  @Original_CategoryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_MailCategories]
  WHERE
  [TOS_MailCategories].[CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
