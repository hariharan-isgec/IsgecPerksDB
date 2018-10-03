USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterInsert]
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30),
  @ItemDescription NVarChar(100),
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_SiteMarkNo NVarChar(30) = null OUTPUT 
  AS
  INSERT [PAK_SiteItemMaster]
  (
   [ProjectID]
  ,[SiteMarkNo]
  ,[ItemDescription]
  ,[UOMQuantity]
  ,[Quantity]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,UPPER(@SiteMarkNo)
  ,@ItemDescription
  ,@UOMQuantity
  ,@Quantity
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_SiteMarkNo = @SiteMarkNo
GO
