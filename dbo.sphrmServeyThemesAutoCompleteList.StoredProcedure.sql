USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeyThemes].[Description] + ' [' + 
        STR([HRM_ServeyThemes].[ThemeID])
        + ']', [HRM_ServeyThemes].[ThemeID] 
			FROM [HRM_ServeyThemes] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_ServeyThemes].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_ServeyThemes].[Description] + ' [' + 
        STR([HRM_ServeyThemes].[ThemeID])
        + ']', [HRM_ServeyThemes].[ThemeID] 
			FROM [HRM_ServeyThemes] 
      WHERE ThemeID >= @PREFIX 
			ORDER BY [HRM_ServeyThemes].[ThemeID] 
	  END
GO
