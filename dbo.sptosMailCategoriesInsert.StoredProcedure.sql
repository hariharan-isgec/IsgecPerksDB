USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesInsert]
  @Description NVarChar(100),
  @Active Bit,
  @Sequence Int,
  @Return_CategoryID Int = null OUTPUT 
  AS
  INSERT [TOS_MailCategories]
  (
   [Description]
  ,[Active]
  ,[Sequence]
  )
  VALUES
  (
   @Description
  ,@Active
  ,@Sequence
  )
  SET @Return_CategoryID = Scope_Identity()
GO
