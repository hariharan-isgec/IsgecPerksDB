USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesDelete]
  @Original_CityID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Cities]
  WHERE
  [TA_Cities].[CityID] = @Original_CityID
  SET @RowCount = @@RowCount
GO
