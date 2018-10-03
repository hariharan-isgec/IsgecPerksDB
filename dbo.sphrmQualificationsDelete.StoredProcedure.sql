USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmQualificationsDelete]
  @Original_QualificationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Qualifications]
  WHERE
  [HRM_Qualifications].[QualificationID] = @Original_QualificationID
  SET @RowCount = @@RowCount
GO
