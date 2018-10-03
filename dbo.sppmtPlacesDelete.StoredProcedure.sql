USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesDelete]
  @Original_PlaceID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_Places]
  WHERE
  [PMT_Places].[PlaceID] = @Original_PlaceID
  SET @RowCount = @@RowCount
GO
