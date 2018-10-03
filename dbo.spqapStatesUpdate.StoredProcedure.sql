USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesUpdate]
  @Original_StatusID Int, 
  @QAPStatus NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_States] SET 
   [QAPStatus] = @QAPStatus
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
