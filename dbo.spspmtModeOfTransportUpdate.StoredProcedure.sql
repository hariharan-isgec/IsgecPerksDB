USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportUpdate]
  @Original_ModeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ModeOfTransport] SET 
   [Description] = @Description
  WHERE
  [ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
