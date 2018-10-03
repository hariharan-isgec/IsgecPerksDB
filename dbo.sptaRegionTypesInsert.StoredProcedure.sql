USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesInsert]
  @RegionTypeID NVarChar(10),
  @RegionTypeName NVarChar(50),
  @Return_RegionTypeID NVarChar(10) = null OUTPUT 
  AS
  INSERT [TA_RegionTypes]
  (
   [RegionTypeID]
  ,[RegionTypeName]
  )
  VALUES
  (
   UPPER(@RegionTypeID)
  ,@RegionTypeName
  )
  SET @Return_RegionTypeID = @RegionTypeID
GO
