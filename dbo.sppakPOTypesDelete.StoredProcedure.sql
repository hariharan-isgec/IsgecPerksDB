USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesDelete]
  @Original_POTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POTypes]
  WHERE
  [PAK_POTypes].[POTypeID] = @Original_POTypeID
  SET @RowCount = @@RowCount
GO
