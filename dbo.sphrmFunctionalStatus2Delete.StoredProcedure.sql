USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2Delete]
  @Original_FunctionalStatusID2 Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_FunctionalStatus2]
  WHERE
  [HRM_FunctionalStatus2].[FunctionalStatusID2] = @Original_FunctionalStatusID2
  SET @RowCount = @@RowCount
GO
