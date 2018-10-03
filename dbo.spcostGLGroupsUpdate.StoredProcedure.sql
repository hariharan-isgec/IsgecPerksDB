USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsUpdate]
  @Original_GLGroupID Int, 
  @GLNatureID Int,
  @GLGroupDescriptions NVarChar(50),
  @CostGLGroupID Int,
  @Sequence Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_GLGroups] SET 
   [GLNatureID] = @GLNatureID
  ,[GLGroupDescriptions] = @GLGroupDescriptions
  ,[CostGLGroupID] = @CostGLGroupID
  ,[Sequence] = @Sequence
  WHERE
  [GLGroupID] = @Original_GLGroupID
  SET @RowCount = @@RowCount
GO
