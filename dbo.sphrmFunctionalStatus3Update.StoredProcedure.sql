USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3Update]
  @Description NVarChar(50),
  @Original_FunctionalStatusID3 Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_FunctionalStatus3] SET 
   [Description] = @Description
  WHERE
  [FunctionalStatusID3] = @Original_FunctionalStatusID3
  SET @RowCount = @@RowCount
GO
