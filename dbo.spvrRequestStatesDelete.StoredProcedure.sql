USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_RequestStates]
  WHERE
  [VR_RequestStates].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
