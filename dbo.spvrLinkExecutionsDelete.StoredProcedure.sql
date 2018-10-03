USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsDelete]
  @Original_LinkID Int,
  @Original_SRNNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_LinkExecutions]
  WHERE
  [VR_LinkExecutions].[LinkID] = @Original_LinkID
  AND [VR_LinkExecutions].[SRNNo] = @Original_SRNNo
  SET @RowCount = @@RowCount
GO
