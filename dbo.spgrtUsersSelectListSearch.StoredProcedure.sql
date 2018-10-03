USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (UserID)
  SELECT [GRT_Users].[UserID] FROM [GRT_Users]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [GRT_Users].[UserID] = [HRM_Employees1].[CardNo]
 WHERE  
      [GRT_Users].[UserID] = (@UserID)
   AND ( 
         LOWER(ISNULL([GRT_Users].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Users].[Designation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Users].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Users].[DirectNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Users].[CellNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [GRT_Users].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [GRT_Users].[UserID] END DESC,
     CASE @OrderBy WHEN 'Designation' THEN [GRT_Users].[Designation] END,
     CASE @OrderBy WHEN 'Designation DESC' THEN [GRT_Users].[Designation] END DESC,
     CASE @OrderBy WHEN 'Department' THEN [GRT_Users].[Department] END,
     CASE @OrderBy WHEN 'Department DESC' THEN [GRT_Users].[Department] END DESC,
     CASE @OrderBy WHEN 'DirectNo' THEN [GRT_Users].[DirectNo] END,
     CASE @OrderBy WHEN 'DirectNo DESC' THEN [GRT_Users].[DirectNo] END DESC,
     CASE @OrderBy WHEN 'CellNo' THEN [GRT_Users].[CellNo] END,
     CASE @OrderBy WHEN 'CellNo DESC' THEN [GRT_Users].[CellNo] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[GRT_Users].[UserID] ,
		[GRT_Users].[Designation] ,
		[GRT_Users].[Department] ,
		[GRT_Users].[DirectNo] ,
		[GRT_Users].[CellNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [GRT_Users] 
    	INNER JOIN #PageIndex
          ON [GRT_Users].[UserID] = #PageIndex.UserID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [GRT_Users].[UserID] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
