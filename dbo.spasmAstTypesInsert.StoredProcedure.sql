USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesInsert]
  @AssetTypeID NVarChar(10),
  @Description NVarChar(50),
  @IssueToLocation Bit,
  @Return_AssetTypeID NVarChar(10) = null OUTPUT
  AS
  INSERT [ASM_AstTypes]
  (
   [AssetTypeID]
  ,[Description]
  ,[IssueToLocation]
  )
  VALUES
  (
   @AssetTypeID
  ,@Description
  ,@IssueToLocation
  )
  SET @Return_AssetTypeID = @AssetTypeID
GO
