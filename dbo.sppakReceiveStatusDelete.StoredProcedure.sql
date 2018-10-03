USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusDelete]
  @Original_ReceiveStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_ReceiveStatus]
  WHERE
  [PAK_ReceiveStatus].[ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
