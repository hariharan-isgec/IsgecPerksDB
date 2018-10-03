USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDesignationsDelete]
  @Original_DesignationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Designations]
  WHERE
  [HRM_Designations].[DesignationID] = @Original_DesignationID
  SET @RowCount = @@RowCount
GO
