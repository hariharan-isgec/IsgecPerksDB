USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesDelete]
  @Original_TravelTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_TravelTypes]
  WHERE
  [TA_TravelTypes].[TravelTypeID] = @Original_TravelTypeID
  SET @RowCount = @@RowCount
GO
