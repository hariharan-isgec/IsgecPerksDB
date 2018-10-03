USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesDelete]
  @Original_GLNatureID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_GLNatures]
  WHERE
  [COST_GLNatures].[GLNatureID] = @Original_GLNatureID
  SET @RowCount = @@RowCount
GO
