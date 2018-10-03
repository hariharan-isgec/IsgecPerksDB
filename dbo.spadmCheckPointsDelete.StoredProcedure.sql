USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsDelete]
  @Original_CheckPointID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_CheckPoints]
  WHERE
  [ADM_CheckPoints].[CheckPointID] = @Original_CheckPointID
  SET @RowCount = @@RowCount
GO
