USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetIssueInsert]
  @Remarks NVarChar(100),
  @LocationID Int,
  @UserID Int,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @AssetID Int = null OUTPUT
  AS
  INSERT [AST_AssetDetails]
  (
   [Remarks]
  ,[LocationID]
  ,[UserID]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @Remarks
  ,@LocationID
  ,@UserID
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @AssetID = Scope_Identity()
GO
