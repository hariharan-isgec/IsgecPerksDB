USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesDelete]
  @Original_CityTypeID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_CityTypes]
  WHERE
  [TA_CityTypes].[CityTypeID] = @Original_CityTypeID
  SET @RowCount = @@RowCount
GO
