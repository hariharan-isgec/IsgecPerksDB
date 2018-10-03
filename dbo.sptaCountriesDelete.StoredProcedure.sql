USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesDelete]
  @Original_CountryID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Countries]
  WHERE
  [TA_Countries].[CountryID] = @Original_CountryID
  SET @RowCount = @@RowCount
GO
