USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsUpdate]
  @Original_GroupID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_EmployeeGroups] SET 
   [Description] = @Description
  WHERE
  [GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
