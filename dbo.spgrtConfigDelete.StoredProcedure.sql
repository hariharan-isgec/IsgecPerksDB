USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigDelete]
  @Original_GreetingID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [GRT_Config]
  WHERE
  [GRT_Config].[GreetingID] = @Original_GreetingID
  SET @RowCount = @@RowCount
GO
