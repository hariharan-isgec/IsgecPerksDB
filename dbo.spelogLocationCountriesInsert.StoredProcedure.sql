USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesInsert]
  @Description NVarChar(50),
  @Return_LocationCountryID Int = null OUTPUT 
  AS
  INSERT [ELOG_LocationCountries]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_LocationCountryID = Scope_Identity()
GO
