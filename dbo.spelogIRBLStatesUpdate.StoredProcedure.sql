USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesUpdate]
  @Original_StatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_IRBLStates] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
