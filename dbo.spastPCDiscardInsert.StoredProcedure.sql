USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDiscardInsert]
  @Remarks NVarChar(200),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [Remarks]
  ,[Discarded]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @Remarks
  ,@Discarded
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @pcID = Scope_Identity()
GO
