USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsDelete]
  @Original_PortID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_Ports]
  WHERE
  [ELOG_Ports].[PortID] = @Original_PortID
  SET @RowCount = @@RowCount
GO
