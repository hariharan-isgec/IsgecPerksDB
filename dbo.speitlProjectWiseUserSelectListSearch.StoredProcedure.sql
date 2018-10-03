USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserSelectListSearch]
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
 ,SerialNo BigInt NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [EITL_ProjectWiseUser].[SerialNo] FROM [EITL_ProjectWiseUser]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_ProjectWiseUser].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [EITL_ProjectWiseUser].[ProjectID] = [IDM_Projects2].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([EITL_ProjectWiseUser].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_ProjectWiseUser].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_ProjectWiseUser].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_ProjectWiseUser].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [EITL_ProjectWiseUser].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [EITL_ProjectWiseUser].[UserID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [EITL_ProjectWiseUser].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [EITL_ProjectWiseUser].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_ProjectWiseUser].[SerialNo] ,
		[EITL_ProjectWiseUser].[UserID] ,
		[EITL_ProjectWiseUser].[ProjectID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [EITL_ProjectWiseUser] 
    	INNER JOIN #PageIndex
          ON [EITL_ProjectWiseUser].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_ProjectWiseUser].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [EITL_ProjectWiseUser].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
