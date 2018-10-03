USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaDelete]
  @Original_FunctionalAreaID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_FunctionalArea]
  WHERE
  [TOS_FunctionalArea].[FunctionalAreaID] = @Original_FunctionalAreaID
  SET @RowCount = @@RowCount
GO
