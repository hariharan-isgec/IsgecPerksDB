USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPriorityUpdate]
  @Original_PriorityID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_RequestPriority] SET 
   [Description] = @Description
  WHERE
  [PriorityID] = @Original_PriorityID
  SET @RowCount = @@RowCount
GO
