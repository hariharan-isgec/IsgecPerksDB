USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusDelete]
  @Original_SendStatusID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_SendStatus]
  WHERE
  [DCM_SendStatus].[SendStatusID] = @Original_SendStatusID
  SET @RowCount = @@RowCount
GO
