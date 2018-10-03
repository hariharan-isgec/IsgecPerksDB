USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusUpdate]
  @Original_SendStatusID NVarChar(2), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_SendStatus] SET 
   [Description] = @Description
  WHERE
  [SendStatusID] = @Original_SendStatusID
  SET @RowCount = @@RowCount
GO
