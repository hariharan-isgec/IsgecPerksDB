USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByLGMenuAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRSessionByVRMenu].[VRSessionID] + ' [' + 
        STR([SYS_VRSessionByVRMenu].[RecordID])
        + ']', [SYS_VRSessionByVRMenu].[RecordID] 
			FROM [SYS_VRSessionByVRMenu] 
      WHERE LOWER(VRSessionID) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [SYS_VRSessionByVRMenu].[VRSessionID] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRSessionByVRMenu].[VRSessionID] + ' [' + 
        STR([SYS_VRSessionByVRMenu].[RecordID])
        + ']', [SYS_VRSessionByVRMenu].[RecordID] 
			FROM [SYS_VRSessionByVRMenu] 
      WHERE RecordID >= @PREFIX 
			ORDER BY [SYS_VRSessionByVRMenu].[RecordID] 
	  END
GO
