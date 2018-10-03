USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesDelete]
  @Original_LocationTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteLocationTypes]
  WHERE
  [PAK_SiteLocationTypes].[LocationTypeID] = @Original_LocationTypeID
  SET @RowCount = @@RowCount
GO
