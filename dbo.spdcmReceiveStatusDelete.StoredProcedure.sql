USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusDelete]
  @Original_ReceiveStatusID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_ReceiveStatus]
  WHERE
  [DCM_ReceiveStatus].[ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
