USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsUpdate]
  @Original_GroupID Int, 
  @GroupName NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_Groups] SET 
   [GroupName] = @GroupName
  WHERE
  [GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
