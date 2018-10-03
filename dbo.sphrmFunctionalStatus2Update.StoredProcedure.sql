USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2Update]
  @Description NVarChar(50),
  @Original_FunctionalStatusID2 Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_FunctionalStatus2] SET 
   [Description] = @Description
  WHERE
  [FunctionalStatusID2] = @Original_FunctionalStatusID2
  SET @RowCount = @@RowCount
GO
