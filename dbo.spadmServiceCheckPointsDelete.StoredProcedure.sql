USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsDelete]
  @Original_ServiceID NVarChar(10),
  @Original_CheckPointID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ServiceCheckPoints]
  WHERE
  [ADM_ServiceCheckPoints].[ServiceID] = @Original_ServiceID
  AND [ADM_ServiceCheckPoints].[CheckPointID] = @Original_CheckPointID
  SET @RowCount = @@RowCount
GO
