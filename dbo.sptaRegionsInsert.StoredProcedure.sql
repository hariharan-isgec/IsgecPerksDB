USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsInsert]
  @RegionID NVarChar(10),
  @RegionName NVarChar(50),
  @RegionTypeID NVarChar(10),
  @CurrencyID NVarChar(6),
  @Return_RegionID NVarChar(10) = null OUTPUT 
  AS
  INSERT [TA_Regions]
  (
   [RegionID]
  ,[RegionName]
  ,[RegionTypeID]
  ,[CurrencyID]
  )
  VALUES
  (
   UPPER(@RegionID)
  ,@RegionName
  ,@RegionTypeID
  ,@CurrencyID
  )
  SET @Return_RegionID = @RegionID
GO
