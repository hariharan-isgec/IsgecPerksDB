USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4Update]
  @Description NVarChar(50),
  @Original_FunctionalStatusID4 Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_FunctionalStatus4] SET 
   [Description] = @Description
  WHERE
  [FunctionalStatusID4] = @Original_FunctionalStatusID4
  SET @RowCount = @@RowCount
GO
