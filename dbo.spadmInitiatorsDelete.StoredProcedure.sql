USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorsDelete]
  @Original_ServiceID NVarChar(10),
  @Original_InitiatorID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Initiators]
  WHERE
  [ADM_Initiators].[ServiceID] = @Original_ServiceID
  AND [ADM_Initiators].[InitiatorID] = @Original_InitiatorID
  SET @RowCount = @@RowCount
GO
