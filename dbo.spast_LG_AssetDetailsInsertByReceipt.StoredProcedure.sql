USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spast_LG_AssetDetailsInsertByReceipt]
  @MrnID Int,
  @AssetTypeID Int,
  @BrandID Int,
  @Model NVarChar(50),
  @Remarks NVarChar(100),
  @AssetID Int = null OUTPUT
  AS
  INSERT [AST_AssetDetails]
  (
   [MrnID]
  ,[AssetTypeID]
  ,[BrandID]
  ,[Model]
  ,[Remarks]
  )
  VALUES
  (
   @MrnID
  ,@AssetTypeID
  ,@BrandID
  ,@Model
  ,@Remarks
  )
  SET @AssetID = Scope_Identity()
GO
