USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCSerialNoInsert]
  @SerialNo NVarChar(50),
  @AssetNo NVarChar(20),
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [SerialNo]
  ,[AssetNo]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @SerialNo
  ,@AssetNo
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @pcID = Scope_Identity()
GO
