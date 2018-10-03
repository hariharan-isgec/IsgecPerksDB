USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistoryInsert]
  @HistoryType NVarChar(20),
  @MrnID Int,
  @AssetID Int,
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
  @ModifiedOn DateTime,
  @ModifiedBy Int,
  @HistoryID Int = null OUTPUT
  AS
  INSERT [AST_AssetHistory]
  (
   [HistoryType]
  ,[MrnID]
  ,[AssetID]
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
  ,[ModifiedOn]
  ,[ModifiedBy]
  )
  VALUES
  (
   @HistoryType
  ,@MrnID
  ,@AssetID
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
  ,@ModifiedOn
  ,@ModifiedBy
  )
  SET @HistoryID = Scope_Identity()
GO
