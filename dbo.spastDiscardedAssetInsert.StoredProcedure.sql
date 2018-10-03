USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedAssetInsert]
  @Remarks NVarChar(100),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @AssetID Int = null OUTPUT
  AS
  INSERT [AST_AssetDetails]
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
  SET @AssetID = Scope_Identity()
GO
