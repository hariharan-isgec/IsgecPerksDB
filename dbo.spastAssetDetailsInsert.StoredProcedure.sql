USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetDetailsInsert]
  @MrnID Int,
  @AssetTypeID Int,
  @BrandID Int,
  @Model NVarChar(50),
  @Features NVarChar(100),
  @AssetNo NVarChar(20),
  @SerialNo NVarChar(50),
  @LocationID Int,
  @UserID Int,
  @Remarks NVarChar(100),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @AssetID Int = null OUTPUT
  AS
  INSERT [AST_AssetDetails]
  (
   [MrnID]
  ,[AssetTypeID]
  ,[BrandID]
  ,[Model]
  ,[Features]
  ,[AssetNo]
  ,[SerialNo]
  ,[LocationID]
  ,[UserID]
  ,[Remarks]
  ,[Discarded]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @MrnID
  ,@AssetTypeID
  ,@BrandID
  ,@Model
  ,@Features
  ,@AssetNo
  ,@SerialNo
  ,@LocationID
  ,@UserID
  ,@Remarks
  ,@Discarded
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @AssetID = Scope_Identity()
GO
