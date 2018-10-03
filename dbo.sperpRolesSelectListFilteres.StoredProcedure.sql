USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RoleID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RoleID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_Roles].[RoleID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_Roles] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RoleID' THEN '[ERP_Roles].[RoleID]'
                        WHEN 'RoleID DESC' THEN '[ERP_Roles].[RoleID] DESC'
                        WHEN 'Description' THEN '[ERP_Roles].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_Roles].[Description] DESC'
                        ELSE '[ERP_Roles].[RoleID]'
                    END
  EXEC (@LGSQL)

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
