USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_ODCReasons]
  WHERE
  [VR_ODCReasons].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
