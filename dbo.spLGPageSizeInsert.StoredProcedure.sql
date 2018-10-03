USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGPageSizeInsert]
  @LoginID NVarChar(20),
  @PageName NVarChar(250),
  @PageSize Int,
  @PageNo Int,
  @ApplicationID Int,
  @Return_PageID Int = null OUTPUT
  AS
  INSERT [SYS_LGPageSize]
  (
   [LoginID]
  ,[PageName]
  ,[PageSize]
  ,[PageNo]
  ,[ApplicationID]
  )
  VALUES
  (
   @LoginID
  ,@PageName
  ,@PageSize
  ,@PageNo
  ,@ApplicationID
  )
  SET @Return_PageID = Scope_Identity()
GO
