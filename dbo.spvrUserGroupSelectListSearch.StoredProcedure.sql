USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserGroupSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [VR_UserGroup].[SerialNo] FROM [VR_UserGroup]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserGroup].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [VR_Groups] AS [VR_Groups2]
    ON [VR_UserGroup].[GroupID] = [VR_Groups2].[GroupID]
 WHERE  
   ( 
         STR(ISNULL([VR_UserGroup].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_UserGroup].[UserID],'')) LIKE @KeyWord1
     OR STR(ISNULL([VR_UserGroup].[GroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_UserGroup].[RoleID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_UserGroup].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_UserGroup].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [VR_UserGroup].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [VR_UserGroup].[UserID] END DESC,
     CASE @OrderBy WHEN 'GroupID' THEN [VR_UserGroup].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [VR_UserGroup].[GroupID] END DESC,
     CASE @OrderBy WHEN 'RoleID' THEN [VR_UserGroup].[RoleID] END,
     CASE @OrderBy WHEN 'RoleID DESC' THEN [VR_UserGroup].[RoleID] END DESC,
     CASE @OrderBy WHEN 'OutOfContractApprover' THEN [VR_UserGroup].[OutOfContractApprover] END,
     CASE @OrderBy WHEN 'OutOfContractApprover DESC' THEN [VR_UserGroup].[OutOfContractApprover] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'VR_Groups2_GroupName' THEN [VR_Groups2].[GroupName] END,
     CASE @OrderBy WHEN 'VR_Groups2_GroupName DESC' THEN [VR_Groups2].[GroupName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_UserGroup].[SerialNo] ,
		[VR_UserGroup].[UserID] ,
		[VR_UserGroup].[GroupID] ,
		[VR_UserGroup].[RoleID] ,
		[VR_UserGroup].[OutOfContractApprover] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VR_Groups2].[GroupName] AS VR_Groups2_GroupName 
  FROM [VR_UserGroup] 
    	INNER JOIN #PageIndex
          ON [VR_UserGroup].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserGroup].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [VR_Groups] AS [VR_Groups2]
    ON [VR_UserGroup].[GroupID] = [VR_Groups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
