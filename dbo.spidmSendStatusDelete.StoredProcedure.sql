USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusDelete]
  @Original_SendStatusID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_SendStatus]
  WHERE
  [IDM_SendStatus].[SendStatusID] = @Original_SendStatusID
  SET @RowCount = @@RowCount
GO
