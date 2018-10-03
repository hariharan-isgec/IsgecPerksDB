USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesUpdate]
  @Original_ActivityID NVarChar(20), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_Activities] SET 
   [Description] = @Description
  WHERE
  [ActivityID] = @Original_ActivityID
  SET @RowCount = @@RowCount
GO
