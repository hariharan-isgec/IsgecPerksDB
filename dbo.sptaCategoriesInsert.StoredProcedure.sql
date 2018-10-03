USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesInsert]
  @CategoryCode NVarChar(10),
  @CategoryDescription NVarChar(100),
  @CategorySequence Int,
  @cmba NVarChar(111),
  @Return_CategoryID Int = null OUTPUT 
  AS
  INSERT [TA_Categories]
  (
   [CategoryCode]
  ,[CategoryDescription]
  ,[CategorySequence]
  )
  VALUES
  (
   @CategoryCode
  ,@CategoryDescription
  ,@CategorySequence
  )
  SET @Return_CategoryID = Scope_Identity()
GO
