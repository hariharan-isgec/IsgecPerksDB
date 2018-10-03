USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGDelete]
  @Original_InspectorGroupID Int,
  @Original_EmployeeGroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectorGroupEmployeeGroup]
  WHERE
  [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = @Original_InspectorGroupID
  AND [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = @Original_EmployeeGroupID
  SET @RowCount = @@RowCount
GO
