USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPriorityUpdate]
  @Description NVarChar(30),
  @Original_Priority NVarChar(1), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Priority] SET 
   [Description] = @Description
  WHERE
  [Priority] = @Original_Priority
  SET @RowCount = @@RowCount
GO
