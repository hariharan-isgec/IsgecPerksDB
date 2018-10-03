USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertDelete]
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_SanctionAlert]
  WHERE
  [VR_SanctionAlert].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
