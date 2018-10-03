USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptos_LGol_ProjectsSelectList]
  @OrderBy NVarChar(50),
  @LoginEMailID NVarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
		DECLARE @LoginID NVarChar(8) 
    SELECT @LoginID = CardNo FROM HRM_Employees WHERE LOWER(EMailID) = LOWER(@LoginEMailID)
		IF (@@ROWCOUNT = 0) -- EMAIL ID NOT FOUND
			SELECT
				[IDM_Projects].[ProjectID] ,
				[IDM_Projects].[Description] 
			FROM [IDM_Projects] 
			WHERE 1 = 1  
			ORDER BY
				 CASE @OrderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
				 CASE @OrderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
				 CASE @OrderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
				 CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC  
		ELSE
			SELECT
				[IDM_Projects].[ProjectID] ,
				[IDM_Projects].[Description] 
			FROM [IDM_Projects] 
			WHERE [IDM_Projects].[ProjectID] IN (SELECT PROJECTID FROM TOS_UserViews WHERE UserID = @LoginID)  
			ORDER BY
				 CASE @OrderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
				 CASE @OrderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
				 CASE @OrderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
				 CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC  

		SET @RecordCount = @@RowCount
	END
GO
