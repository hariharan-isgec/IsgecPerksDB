USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPriorityDelete]
  @Original_PriorityID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_RequestPriority]
  WHERE
  [ERP_RequestPriority].[PriorityID] = @Original_PriorityID
  SET @RowCount = @@RowCount
GO
