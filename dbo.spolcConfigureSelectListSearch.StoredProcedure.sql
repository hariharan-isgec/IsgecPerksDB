USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcConfigureSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @Configured Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID)
  SELECT [OLC_Requests].[RequestID] FROM [OLC_Requests]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OLC_Requests].[ConfiguredBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [OLC_Requests].[RemovedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [OLC_Requests].[RemoveRequestedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [OLC_Requests].[RequestedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [OLC_Requests].[CardNo] = [HRM_Employees5].[CardNo]
 WHERE  
      [OLC_Requests].[Configured] = (@Configured)
   AND ( 
         STR(ISNULL([OLC_Requests].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[RequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[NetworkIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[OLCPassword],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[ConfiguredBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[ConfigurationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[RemoveRequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[RemoveRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[RemovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OLC_Requests].[RemovedRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [OLC_Requests].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [OLC_Requests].[RequestID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [OLC_Requests].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [OLC_Requests].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [OLC_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [OLC_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'RequestedBy' THEN [OLC_Requests].[RequestedBy] END,
     CASE @OrderBy WHEN 'RequestedBy DESC' THEN [OLC_Requests].[RequestedBy] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [OLC_Requests].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [OLC_Requests].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'Configured' THEN [OLC_Requests].[Configured] END,
     CASE @OrderBy WHEN 'Configured DESC' THEN [OLC_Requests].[Configured] END DESC,
     CASE @OrderBy WHEN 'NetworkIP' THEN [OLC_Requests].[NetworkIP] END,
     CASE @OrderBy WHEN 'NetworkIP DESC' THEN [OLC_Requests].[NetworkIP] END DESC,
     CASE @OrderBy WHEN 'OLCPassword' THEN [OLC_Requests].[OLCPassword] END,
     CASE @OrderBy WHEN 'OLCPassword DESC' THEN [OLC_Requests].[OLCPassword] END DESC,
     CASE @OrderBy WHEN 'ConfiguredBy' THEN [OLC_Requests].[ConfiguredBy] END,
     CASE @OrderBy WHEN 'ConfiguredBy DESC' THEN [OLC_Requests].[ConfiguredBy] END DESC,
     CASE @OrderBy WHEN 'ConfiguredOn' THEN [OLC_Requests].[ConfiguredOn] END,
     CASE @OrderBy WHEN 'ConfiguredOn DESC' THEN [OLC_Requests].[ConfiguredOn] END DESC,
     CASE @OrderBy WHEN 'ConfigurationRemarks' THEN [OLC_Requests].[ConfigurationRemarks] END,
     CASE @OrderBy WHEN 'ConfigurationRemarks DESC' THEN [OLC_Requests].[ConfigurationRemarks] END DESC,
     CASE @OrderBy WHEN 'RemoveAccess' THEN [OLC_Requests].[RemoveAccess] END,
     CASE @OrderBy WHEN 'RemoveAccess DESC' THEN [OLC_Requests].[RemoveAccess] END DESC,
     CASE @OrderBy WHEN 'RemoveRequestedBy' THEN [OLC_Requests].[RemoveRequestedBy] END,
     CASE @OrderBy WHEN 'RemoveRequestedBy DESC' THEN [OLC_Requests].[RemoveRequestedBy] END DESC,
     CASE @OrderBy WHEN 'RemoveRequestedOn' THEN [OLC_Requests].[RemoveRequestedOn] END,
     CASE @OrderBy WHEN 'RemoveRequestedOn DESC' THEN [OLC_Requests].[RemoveRequestedOn] END DESC,
     CASE @OrderBy WHEN 'RemoveRemarks' THEN [OLC_Requests].[RemoveRemarks] END,
     CASE @OrderBy WHEN 'RemoveRemarks DESC' THEN [OLC_Requests].[RemoveRemarks] END DESC,
     CASE @OrderBy WHEN 'Removed' THEN [OLC_Requests].[Removed] END,
     CASE @OrderBy WHEN 'Removed DESC' THEN [OLC_Requests].[Removed] END DESC,
     CASE @OrderBy WHEN 'RemovedBy' THEN [OLC_Requests].[RemovedBy] END,
     CASE @OrderBy WHEN 'RemovedBy DESC' THEN [OLC_Requests].[RemovedBy] END DESC,
     CASE @OrderBy WHEN 'RemovedOn' THEN [OLC_Requests].[RemovedOn] END,
     CASE @OrderBy WHEN 'RemovedOn DESC' THEN [OLC_Requests].[RemovedOn] END DESC,
     CASE @OrderBy WHEN 'RemovedRemarks' THEN [OLC_Requests].[RemovedRemarks] END,
     CASE @OrderBy WHEN 'RemovedRemarks DESC' THEN [OLC_Requests].[RemovedRemarks] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[OLC_Requests].[RequestID] ,
		[OLC_Requests].[CardNo] ,
		[OLC_Requests].[Remarks] ,
		[OLC_Requests].[RequestedBy] ,
		[OLC_Requests].[RequestedOn] ,
		[OLC_Requests].[Configured] ,
		[OLC_Requests].[NetworkIP] ,
		[OLC_Requests].[OLCPassword] ,
		[OLC_Requests].[ConfiguredBy] ,
		[OLC_Requests].[ConfiguredOn] ,
		[OLC_Requests].[ConfigurationRemarks] ,
		[OLC_Requests].[RemoveAccess] ,
		[OLC_Requests].[RemoveRequestedBy] ,
		[OLC_Requests].[RemoveRequestedOn] ,
		[OLC_Requests].[RemoveRemarks] ,
		[OLC_Requests].[Removed] ,
		[OLC_Requests].[RemovedBy] ,
		[OLC_Requests].[RemovedOn] ,
		[OLC_Requests].[RemovedRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName 
  FROM [OLC_Requests] 
    	INNER JOIN #PageIndex
          ON [OLC_Requests].[RequestID] = #PageIndex.RequestID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OLC_Requests].[ConfiguredBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [OLC_Requests].[RemovedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [OLC_Requests].[RemoveRequestedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [OLC_Requests].[RequestedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [OLC_Requests].[CardNo] = [HRM_Employees5].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
