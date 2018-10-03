USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmQualificationsSelectByID]
  @QualificationID Int
  AS
  SELECT
		[HRM_Qualifications].[QualificationID],
		[HRM_Qualifications].[Description] 
  FROM [HRM_Qualifications] 
  WHERE
  [HRM_Qualifications].[QualificationID] = @QualificationID
GO
