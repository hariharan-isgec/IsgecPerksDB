USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsDelete]
  @Original_GroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_EmployeeGroups]
  WHERE
  [QCM_EmployeeGroups].[GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO
