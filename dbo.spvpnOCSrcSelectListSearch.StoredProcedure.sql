USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnOCSrcSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,id Int NOT NULL
  )
  INSERT INTO #PageIndex (id)
  SELECT [OCS_RegisteredComputers].[id] FROM [OCS_RegisteredComputers]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OCS_RegisteredComputers].[CardNo] = [aspnet_Users1].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([OCS_RegisteredComputers].[id], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([OCS_RegisteredComputers].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OCS_RegisteredComputers].[name],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OCS_RegisteredComputers].[macaddr],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([OCS_RegisteredComputers].[ipaddress],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'id' THEN [OCS_RegisteredComputers].[id] END,
     CASE @orderBy WHEN 'id DESC' THEN [OCS_RegisteredComputers].[id] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [OCS_RegisteredComputers].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [OCS_RegisteredComputers].[CardNo] END DESC,
     CASE @orderBy WHEN 'name' THEN [OCS_RegisteredComputers].[name] END,
     CASE @orderBy WHEN 'name DESC' THEN [OCS_RegisteredComputers].[name] END DESC,
     CASE @orderBy WHEN 'macaddr' THEN [OCS_RegisteredComputers].[macaddr] END,
     CASE @orderBy WHEN 'macaddr DESC' THEN [OCS_RegisteredComputers].[macaddr] END DESC,
     CASE @orderBy WHEN 'ipaddress' THEN [OCS_RegisteredComputers].[ipaddress] END,
     CASE @orderBy WHEN 'ipaddress DESC' THEN [OCS_RegisteredComputers].[ipaddress] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

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
