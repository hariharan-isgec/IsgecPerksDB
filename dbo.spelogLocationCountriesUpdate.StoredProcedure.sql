USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesUpdate]
  @Original_LocationCountryID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_LocationCountries] SET 
   [Description] = @Description
  WHERE
  [LocationCountryID] = @Original_LocationCountryID
  SET @RowCount = @@RowCount
GO
