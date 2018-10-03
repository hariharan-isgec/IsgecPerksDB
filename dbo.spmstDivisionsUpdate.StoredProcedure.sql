USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDivisionsUpdate]
  @Original_DivisionID NVarChar(6), 
  @DivisionID NVarChar(6),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Divisions] SET 
   [DivisionID] = @DivisionID
  ,[Description] = @Description
  WHERE
  [DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
