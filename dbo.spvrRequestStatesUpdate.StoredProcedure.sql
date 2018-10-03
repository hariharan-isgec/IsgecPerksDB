USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesUpdate]
  @Original_StatusID Int, 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_RequestStates] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
