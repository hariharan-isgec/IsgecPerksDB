USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeySheets].[Description] + ' [' + 
        STR([HRM_ServeySheets].[ServeySheetID])
        + ']', [HRM_ServeySheets].[ServeySheetID] 
			FROM [HRM_ServeySheets] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_ServeySheets].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeySheets].[Description] + ' [' + 
        STR([HRM_ServeySheets].[ServeySheetID])
        + ']', [HRM_ServeySheets].[ServeySheetID] 
			FROM [HRM_ServeySheets] 
      WHERE ServeySheetID >= @PREFIX 
			ORDER BY [HRM_ServeySheets].[ServeySheetID] 
	  END
GO
