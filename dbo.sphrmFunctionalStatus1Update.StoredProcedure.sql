USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1Update]
  @Description NVarChar(50),
  @Original_FunctionalStatusID1 Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_FunctionalStatus1] SET 
   [Description] = @Description
  WHERE
  [FunctionalStatusID1] = @Original_FunctionalStatusID1
  SET @RowCount = @@RowCount
GO
