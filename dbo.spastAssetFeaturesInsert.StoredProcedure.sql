USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetFeaturesInsert]
  @Features NVarChar(100),
  @SerialNo NVarChar(50),
  @AssetNo NVarChar(20),
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @AssetID Int = null OUTPUT
  AS
  INSERT [AST_AssetDetails]
  (
   [Features]
  ,[SerialNo]
  ,[AssetNo]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @Features
  ,@SerialNo
  ,@AssetNo
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @AssetID = Scope_Identity()
GO
