USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmQualificationsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Qualifications].[Description] + ' [' + 
        STR([HRM_Qualifications].[QualificationID])
        + ']', [HRM_Qualifications].[QualificationID] 
			FROM [HRM_Qualifications] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Qualifications].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Qualifications].[Description] + ' [' + 
        STR([HRM_Qualifications].[QualificationID])
        + ']', [HRM_Qualifications].[QualificationID] 
			FROM [HRM_Qualifications] 
      WHERE QualificationID >= @PREFIX 
			ORDER BY [HRM_Qualifications].[QualificationID] 
	  END
GO
