USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesUpdate]
  @Original_CategoryID Int, 
  @CategoryCode NVarChar(10),
  @CategoryDescription NVarChar(100),
  @CategorySequence Int,
  @cmba NVarChar(111),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Categories] SET 
   [CategoryCode] = @CategoryCode
  ,[CategoryDescription] = @CategoryDescription
  ,[CategorySequence] = @CategorySequence
  WHERE
  [CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
