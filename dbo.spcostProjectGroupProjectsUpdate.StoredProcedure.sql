USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsUpdate]
  @Original_ProjectGroupID Int, 
  @Original_ProjectID NVarChar(6), 
  @ProjectGroupID Int,
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ProjectGroupProjects] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[ProjectID] = @ProjectID
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
