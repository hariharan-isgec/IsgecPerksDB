USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCategoriesInsert]
  @CategoryCode NVarChar(50),
  @Description NVarChar(50),
  @Active Bit,
  @STDCategory NVarChar(50),
  @CategoryID Int = null OUTPUT
  AS
  INSERT [PRK_Categories]
  (
   [CategoryCode]
  ,[Description]
  ,[Active]
  ,[STDCategory]
  )
  VALUES
  (
   @CategoryCode
  ,@Description
  ,@Active
  ,@STDCategory
  )
  SET @CategoryID = Scope_Identity()
GO
