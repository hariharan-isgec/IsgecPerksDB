USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesUpdate]
  @Original_CityTypeID NVarChar(6), 
  @CityTypeID NVarChar(6),
  @CityTypeName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_CityTypes] SET 
   [CityTypeID] = @CityTypeID
  ,[CityTypeName] = @CityTypeName
  WHERE
  [CityTypeID] = @Original_CityTypeID
  SET @RowCount = @@RowCount
GO
