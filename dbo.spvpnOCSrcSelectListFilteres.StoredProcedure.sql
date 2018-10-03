USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnOCSrcSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,id Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'id'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[OCS_RegisteredComputers].[id]'
  SET @LGSQL = @LGSQL + ' FROM [OCS_RegisteredComputers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [OCS_RegisteredComputers].[CardNo] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [OCS_RegisteredComputers].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'id' THEN '[OCS_RegisteredComputers].[id]'
                        WHEN 'id DESC' THEN '[OCS_RegisteredComputers].[id] DESC'
                        WHEN 'CardNo' THEN '[OCS_RegisteredComputers].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[OCS_RegisteredComputers].[CardNo] DESC'
                        WHEN 'name' THEN '[OCS_RegisteredComputers].[name]'
                        WHEN 'name DESC' THEN '[OCS_RegisteredComputers].[name] DESC'
                        WHEN 'macaddr' THEN '[OCS_RegisteredComputers].[macaddr]'
                        WHEN 'macaddr DESC' THEN '[OCS_RegisteredComputers].[macaddr] DESC'
                        WHEN 'ipaddress' THEN '[OCS_RegisteredComputers].[ipaddress]'
                        WHEN 'ipaddress DESC' THEN '[OCS_RegisteredComputers].[ipaddress] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[OCS_RegisteredComputers].[id]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[OCS_RegisteredComputers].[id] ,
		[OCS_RegisteredComputers].[CardNo] ,
		[OCS_RegisteredComputers].[name] ,
		[OCS_RegisteredComputers].[macaddr] ,
		[OCS_RegisteredComputers].[ipaddress] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [OCS_RegisteredComputers] 
    	INNER JOIN #PageIndex
          ON [OCS_RegisteredComputers].[id] = #PageIndex.id
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OCS_RegisteredComputers].[CardNo] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
