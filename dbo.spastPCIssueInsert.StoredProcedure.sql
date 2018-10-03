USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCIssueInsert]
  @Remarks NVarChar(200),
  @LocationID Int,
  @UserID Int,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
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
  SET @pcID = Scope_Identity()
GO
