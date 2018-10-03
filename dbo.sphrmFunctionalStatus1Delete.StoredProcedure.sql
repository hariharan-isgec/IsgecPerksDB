USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1Delete]
  @Original_FunctionalStatusID1 Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_FunctionalStatus1]
  WHERE
  [HRM_FunctionalStatus1].[FunctionalStatusID1] = @Original_FunctionalStatusID1
  SET @RowCount = @@RowCount
GO
