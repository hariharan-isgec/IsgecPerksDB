USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesDelete]
  @Original_DetailTypeID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_DetailTypes]
  WHERE
  [PMS_DetailTypes].[DetailTypeID] = @Original_DetailTypeID
  SET @RowCount = @@RowCount
GO
