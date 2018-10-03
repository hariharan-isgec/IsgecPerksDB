USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesDelete]
  @Original_ActivityID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_Activities]
  WHERE
  [ASM_Activities].[ActivityID] = @Original_ActivityID
  SET @RowCount = @@RowCount
GO
