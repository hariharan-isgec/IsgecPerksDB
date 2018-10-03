USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupsUpdate]
  @Original_ProjectGroupID Int, 
  @ProjectGroupDescription NVarChar(50),
  @ProjectTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ProjectGroups] SET 
   [ProjectGroupDescription] = @ProjectGroupDescription
  ,[ProjectTypeID] = @ProjectTypeID
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  SET @RowCount = @@RowCount
GO
