USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesDelete]
  @Original_RequestID Int,
  @Original_InspectionID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectionFiles]
  WHERE
  [QCM_InspectionFiles].[RequestID] = @Original_RequestID
  AND [QCM_InspectionFiles].[InspectionID] = @Original_InspectionID
  AND [QCM_InspectionFiles].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
