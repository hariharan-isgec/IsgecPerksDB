USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCategoriesUpdate]
  @CategoryCode NVarChar(50),
  @Description NVarChar(50),
  @Active Bit,
  @STDCategory NVarChar(50),
  @Original_CategoryID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Categories] SET 
   [CategoryCode] = @CategoryCode
  ,[Description] = @Description
  ,[Active] = @Active
  ,[STDCategory] = @STDCategory
  WHERE
  [CategoryID] = @Original_CategoryID
  SET @RowCount = @@RowCount
GO
