USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusDelete]
  @Original_LRStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_LorryReceiptStatus]
  WHERE
  [VR_LorryReceiptStatus].[LRStatusID] = @Original_LRStatusID
  SET @RowCount = @@RowCount
GO
