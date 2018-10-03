USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesDelete]
  @Original_PlaceID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_Places]
  WHERE
  [SPMT_Places].[PlaceID] = @Original_PlaceID
  SET @RowCount = @@RowCount
GO
