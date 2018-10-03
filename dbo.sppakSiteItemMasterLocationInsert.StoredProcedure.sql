USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationInsert]
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30),
  @LocationID Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_SiteMarkNo NVarChar(30) = null OUTPUT, 
  @Return_LocationID Int = null OUTPUT 
  AS
  INSERT [PAK_SiteItemMasterLocation]
  (
   [ProjectID]
  ,[SiteMarkNo]
  ,[LocationID]
  ,[UOMQuantity]
  ,[Quantity]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,UPPER(@SiteMarkNo)
  ,@LocationID
  ,@UOMQuantity
  ,@Quantity
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_SiteMarkNo = @SiteMarkNo
  SET @Return_LocationID = @LocationID
GO
