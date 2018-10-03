USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesDelete]
  @Original_LocationCountryID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_LocationCountries]
  WHERE
  [ELOG_LocationCountries].[LocationCountryID] = @Original_LocationCountryID
  SET @RowCount = @@RowCount
GO
