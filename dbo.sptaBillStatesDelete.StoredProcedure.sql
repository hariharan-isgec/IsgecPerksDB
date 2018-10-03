USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesDelete]
  @Original_BillStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillStates]
  WHERE
  [TA_BillStates].[BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO
