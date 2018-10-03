USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusUpdate]
  @Original_StatusID Int, 
  @StatusID Int,
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_DetentionBillStatus] SET 
   [StatusID] = @StatusID
  ,[Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
