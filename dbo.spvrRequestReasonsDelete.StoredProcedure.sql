USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_RequestReasons]
  WHERE
  [VR_RequestReasons].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
