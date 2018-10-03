USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesUpdate]
  @Original_WorkOrderTypeID Int, 
  @WorkOrderTypeDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_WorkOrderTypes] SET 
   [WorkOrderTypeDescription] = @WorkOrderTypeDescription
  WHERE
  [WorkOrderTypeID] = @Original_WorkOrderTypeID
  SET @RowCount = @@RowCount
GO
