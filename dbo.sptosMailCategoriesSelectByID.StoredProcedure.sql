USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesSelectByID]
  @LoginID NVarChar(8),
  @CategoryID Int 
  AS
  SELECT
		[TOS_MailCategories].[CategoryID] ,
		[TOS_MailCategories].[Description] ,
		[TOS_MailCategories].[Active] ,
		[TOS_MailCategories].[Sequence]  
  FROM [TOS_MailCategories] 
  WHERE
  [TOS_MailCategories].[CategoryID] = @CategoryID
GO
