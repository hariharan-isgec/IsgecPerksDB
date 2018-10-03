USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventStatusDelete]
  @Original_EventID Int,
  @Original_ITServiceID NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITEventStatus]
  WHERE
  [ADM_ITEventStatus].[EventID] = @Original_EventID
  AND [ADM_ITEventStatus].[ITServiceID] = @Original_ITServiceID
  SET @RowCount = @@RowCount
GO
