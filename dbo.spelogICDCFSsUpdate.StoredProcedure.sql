USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsUpdate]
  @Original_ICDCFSID Int, 
  @StuffingPointID Int,
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_ICDCFSs] SET 
   [StuffingPointID] = @StuffingPointID
  ,[Description] = @Description
  WHERE
  [ICDCFSID] = @Original_ICDCFSID
  SET @RowCount = @@RowCount
GO
