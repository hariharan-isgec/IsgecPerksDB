USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReasonsDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Reasons]
  WHERE
  [PAK_Reasons].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
