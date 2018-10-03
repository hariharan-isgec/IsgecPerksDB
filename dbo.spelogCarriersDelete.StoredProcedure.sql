USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersDelete]
  @Original_CarrierID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_Carriers]
  WHERE
  [ELOG_Carriers].[CarrierID] = @Original_CarrierID
  SET @RowCount = @@RowCount
GO
