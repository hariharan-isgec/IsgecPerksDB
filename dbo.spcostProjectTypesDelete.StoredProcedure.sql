USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesDelete]
  @Original_ProjectTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectTypes]
  WHERE
  [COST_ProjectTypes].[ProjectTypeID] = @Original_ProjectTypeID
  SET @RowCount = @@RowCount
GO
