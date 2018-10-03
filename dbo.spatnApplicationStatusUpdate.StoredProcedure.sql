USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusUpdate]
  @Description NVarChar(20),
  @Original_ApplStatusID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplicationStatus] SET 
   [Description] = @Description
  WHERE
  [ApplStatusID] = @Original_ApplStatusID
  SET @RowCount = @@RowCount
GO
