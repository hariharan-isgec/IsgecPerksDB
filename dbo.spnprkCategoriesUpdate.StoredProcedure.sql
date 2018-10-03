USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCategoriesUpdate]
  @Original_CategoryID Int, 
  @CategoryCode NVarChar(50),
  @Description NVarChar(50),
  @Active Bit,
  @STDCategory NVarChar(50),
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
