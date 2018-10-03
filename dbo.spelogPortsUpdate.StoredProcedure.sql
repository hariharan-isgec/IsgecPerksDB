USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsUpdate]
  @Original_PortID Int, 
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_Ports] SET 
   [Description] = @Description
  WHERE
  [PortID] = @Original_PortID
  SET @RowCount = @@RowCount
GO
