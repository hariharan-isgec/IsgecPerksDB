USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_OOEReasons]
  WHERE
  [TA_OOEReasons].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
