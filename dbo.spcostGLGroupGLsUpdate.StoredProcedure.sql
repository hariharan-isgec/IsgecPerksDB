USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsUpdate]
  @Original_GLGroupID Int, 
  @Original_GLCode NVarChar(10), 
  @GLGroupID Int,
  @GLCode NVarChar(10),
  @EffectiveStartDate DateTime,
  @EffectiveEndDate DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_GLGroupGLs] SET 
   [GLGroupID] = @GLGroupID
  ,[GLCode] = @GLCode
  ,[EffectiveStartDate] = @EffectiveStartDate
  ,[EffectiveEndDate] = @EffectiveEndDate
  WHERE
  [GLGroupID] = @Original_GLGroupID
  AND [GLCode] = @Original_GLCode
  SET @RowCount = @@RowCount
GO
