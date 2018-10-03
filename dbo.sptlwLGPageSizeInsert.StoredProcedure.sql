USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeInsert]
  @LoginID NVarChar(20),
  @PageName NVarChar(250),
  @ApplicationID Int,
  @PageSize Int,
  @PageNo Int,
  @Return_PageID Int = null OUTPUT 
  AS
  INSERT [SYS_LGPageSize]
  (
   [LoginID]
  ,[PageName]
  ,[ApplicationID]
  ,[PageSize]
  ,[PageNo]
  )
  VALUES
  (
   @LoginID
  ,@PageName
  ,@ApplicationID
  ,@PageSize
  ,@PageNo
  )
  SET @Return_PageID = Scope_Identity()
GO
