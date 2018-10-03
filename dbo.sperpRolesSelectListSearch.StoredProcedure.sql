USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesSelectListSearch]
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
 ,RoleID Int NOT NULL
  )
  INSERT INTO #PageIndex (RoleID)
  SELECT [ERP_Roles].[RoleID] FROM [ERP_Roles]
 WHERE  
   ( 
         STR(ISNULL([ERP_Roles].[RoleID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_Roles].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RoleID' THEN [ERP_Roles].[RoleID] END,
     CASE @OrderBy WHEN 'RoleID DESC' THEN [ERP_Roles].[RoleID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_Roles].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_Roles].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_Roles].[RoleID] ,
		[ERP_Roles].[Description]  
  FROM [ERP_Roles] 
    	INNER JOIN #PageIndex
          ON [ERP_Roles].[RoleID] = #PageIndex.RoleID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
