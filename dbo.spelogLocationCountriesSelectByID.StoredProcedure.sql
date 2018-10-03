USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesSelectByID]
  @LoginID NVarChar(8),
  @LocationCountryID Int 
  AS
  SELECT
    [ELOG_LocationCountries].*  
  FROM [ELOG_LocationCountries] 
  WHERE
  [ELOG_LocationCountries].[LocationCountryID] = @LocationCountryID
GO
