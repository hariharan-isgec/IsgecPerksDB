USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsUpdate]
  @Description NVarChar(50),
  @Original_DivisionID NVarChar(6), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Divisions] SET 
   [Description] = @Description
  WHERE
  [DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
