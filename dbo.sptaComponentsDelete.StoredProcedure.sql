USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsDelete]
  @Original_ComponentID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Components]
  WHERE
  [TA_Components].[ComponentID] = @Original_ComponentID
  SET @RowCount = @@RowCount
GO
