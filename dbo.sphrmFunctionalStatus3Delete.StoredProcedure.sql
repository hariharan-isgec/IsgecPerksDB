USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3Delete]
  @Original_FunctionalStatusID3 Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_FunctionalStatus3]
  WHERE
  [HRM_FunctionalStatus3].[FunctionalStatusID3] = @Original_FunctionalStatusID3
  SET @RowCount = @@RowCount
GO
