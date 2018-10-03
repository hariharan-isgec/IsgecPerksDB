USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusUpdate]
  @Original_ReceiveStatusID NVarChar(2), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_ReceiveStatus] SET 
   [Description] = @Description
  WHERE
  [ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
