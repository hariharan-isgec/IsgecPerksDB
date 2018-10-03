USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesUpdate]
  @Original_CategoryID Int, 
  @Description NVarChar(100),
  @Active Bit,
  @Sequence Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_MailCategories] SET 
   [Description] = @Description
  ,[Active] = @Active
  ,[Sequence] = @Sequence
  WHERE
  [CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
