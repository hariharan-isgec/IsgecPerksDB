USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusUpdate]
  @Description NVarChar(30),
  @Sequence Int,
  @Original_StatusID NVarChar(2), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Status] SET 
   [Description] = @Description
  ,[Sequence] = @Sequence
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
