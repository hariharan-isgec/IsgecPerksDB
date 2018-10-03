USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsInsert]
  @ApplicationName NVarChar(50),
  @ApplicationDescription NVarChar(250),
  @IsActive Bit,
  @MainPageURL NVarChar(500),
  @AppIconID Int,
  @AppIconStyle NVarChar(500),
  @Return_AppID Int = null OUTPUT 
  AS
  INSERT [MAPP_Applications]
  (
   [ApplicationName]
  ,[ApplicationDescription]
  ,[IsActive]
  ,[MainPageURL]
  ,[AppIconID]
  ,[AppIconStyle]
  )
  VALUES
  (
   @ApplicationName
  ,@ApplicationDescription
  ,@IsActive
  ,@MainPageURL
  ,@AppIconID
  ,@AppIconStyle
  )
  SET @Return_AppID = Scope_Identity()
GO
