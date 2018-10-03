USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusDelete]
  @Original_InspectionStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectionStatus]
  WHERE
  [QCM_InspectionStatus].[InspectionStatusID] = @Original_InspectionStatusID
  SET @RowCount = @@RowCount
GO
