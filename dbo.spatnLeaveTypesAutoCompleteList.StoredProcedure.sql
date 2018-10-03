USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_LeaveTypes].[Description] + ' [' + 
        [ATN_LeaveTypes].[LeaveTypeID]
        + ']', [ATN_LeaveTypes].[LeaveTypeID] 
			FROM [ATN_LeaveTypes] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [ATN_LeaveTypes].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[ATN_LeaveTypes].[Description] + ' [' + 
        [ATN_LeaveTypes].[LeaveTypeID]
        + ']', [ATN_LeaveTypes].[LeaveTypeID] 
			FROM [ATN_LeaveTypes] 
      WHERE LeaveTypeID >= @PREFIX 
			ORDER BY [ATN_LeaveTypes].[LeaveTypeID] 
	  END
GO
