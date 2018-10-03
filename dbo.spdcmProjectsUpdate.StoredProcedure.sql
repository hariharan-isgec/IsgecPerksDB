USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_Projects] SET 
   [Description] = @Description
  WHERE
  [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
