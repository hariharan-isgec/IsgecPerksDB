USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsDelete]
  @Original_RequestID Int,
  @Original_InspectionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_Inspections]
  WHERE
  [QCM_Inspections].[RequestID] = @Original_RequestID
  AND [QCM_Inspections].[InspectionID] = @Original_InspectionID
  SET @RowCount = @@RowCount
GO
