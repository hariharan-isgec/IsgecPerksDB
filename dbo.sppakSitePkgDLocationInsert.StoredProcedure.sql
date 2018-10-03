USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationInsert]
  @ItemNo Int,
  @SiteMarkNo NVarChar(30),
  @LocationID Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @Support Bit,
  @Remarks NVarChar(100),
  @RecSrNo Int,
  @RecNo Int,
  @ProjectID NVarChar(6),
  @BOMNo Int,
  @PkgNo Int,
  @SerialNo Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_RecNo Int = null OUTPUT, 
  @Return_RecSrNo Int = null OUTPUT, 
  @Return_RecSrLNo Int = null OUTPUT 
  AS
  INSERT [PAK_SitePkgDLocation]
  (
   [ItemNo]
  ,[SiteMarkNo]
  ,[LocationID]
  ,[UOMQuantity]
  ,[Quantity]
  ,[Support]
  ,[Remarks]
  ,[RecSrNo]
  ,[RecNo]
  ,[ProjectID]
  ,[BOMNo]
  ,[PkgNo]
  ,[SerialNo]
  )
  VALUES
  (
   @ItemNo
  ,@SiteMarkNo
  ,@LocationID
  ,@UOMQuantity
  ,@Quantity
  ,@Support
  ,@Remarks
  ,@RecSrNo
  ,@RecNo
  ,UPPER(@ProjectID)
  ,@BOMNo
  ,@PkgNo
  ,@SerialNo
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_RecNo = @RecNo
  SET @Return_RecSrNo = @RecSrNo
  SET @Return_RecSrLNo = Scope_Identity()
GO
