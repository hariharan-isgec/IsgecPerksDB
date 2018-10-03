USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsSelectListSearch]
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
 ,GroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (GroupID)
  SELECT [QCM_EmployeeGroups].[GroupID] FROM [QCM_EmployeeGroups]
 WHERE  
   ( 
         STR(ISNULL([QCM_EmployeeGroups].[GroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_EmployeeGroups].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_EmployeeGroups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_EmployeeGroups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_EmployeeGroups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_EmployeeGroups].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_EmployeeGroups].[GroupID] ,
		[QCM_EmployeeGroups].[Description]  
  FROM [QCM_EmployeeGroups] 
    	INNER JOIN #PageIndex
          ON [QCM_EmployeeGroups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
