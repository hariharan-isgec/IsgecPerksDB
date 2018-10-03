USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGUpdate]
  @Original_InspectorGroupID Int, 
  @Original_EmployeeGroupID Int, 
  @InspectorGroupID Int,
  @EmployeeGroupID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_InspectorGroupEmployeeGroup] SET 
   [InspectorGroupID] = @InspectorGroupID
  ,[EmployeeGroupID] = @EmployeeGroupID
  WHERE
  [InspectorGroupID] = @Original_InspectorGroupID
  AND [EmployeeGroupID] = @Original_EmployeeGroupID
  SET @RowCount = @@RowCount
GO
