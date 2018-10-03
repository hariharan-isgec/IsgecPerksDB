USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4Delete]
  @Original_FunctionalStatusID4 Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_FunctionalStatus4]
  WHERE
  [HRM_FunctionalStatus4].[FunctionalStatusID4] = @Original_FunctionalStatusID4
  SET @RowCount = @@RowCount
GO
