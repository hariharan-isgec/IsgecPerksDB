USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpChaneRequestDelete]
  @Original_ApplID Int,
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_ChaneRequest]
  WHERE
  [ERP_ChaneRequest].[ApplID] = @Original_ApplID
  AND [ERP_ChaneRequest].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
