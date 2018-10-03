USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesInsert]
  @Description NVarChar(50),
  @ImageFileName NVarChar(250),
  @DiskFileName NVarChar(50),
  @Return_ImageID Int = null OUTPUT 
  AS
  INSERT [GRT_Images]
  (
   [Description]
  ,[ImageFileName]
  ,[DiskFileName]
  )
  VALUES
  (
   @Description
  ,@ImageFileName
  ,@DiskFileName
  )
  SET @Return_ImageID = Scope_Identity()
GO
