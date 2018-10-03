USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderDelete]
  @Original_SheetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ServiceSheetHeader]
  WHERE
  [ADM_ServiceSheetHeader].[SheetID] = @Original_SheetID
  SET @RowCount = @@RowCount
GO
