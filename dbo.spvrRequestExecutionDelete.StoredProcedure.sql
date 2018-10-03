USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestExecutionDelete]
  @Original_SRNNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_RequestExecution]
  WHERE
  [VR_RequestExecution].[SRNNo] = @Original_SRNNo
  SET @RowCount = @@RowCount
GO
