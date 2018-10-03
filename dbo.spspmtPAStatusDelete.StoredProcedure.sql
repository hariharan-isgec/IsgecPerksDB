USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusDelete]
  @Original_AdviceStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_PAStatus]
  WHERE
  [SPMT_PAStatus].[AdviceStatusID] = @Original_AdviceStatusID
  SET @RowCount = @@RowCount
GO
