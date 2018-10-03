USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomersSelectListFilteres]
  @Filter_CustomerID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CustomerID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Customers].[CustomerID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Customers] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CustomerID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Customers].[CustomerID] = ''' + @Filter_CustomerID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CustomerID' THEN '[IDM_Customers].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[IDM_Customers].[CustomerID] DESC'
                        WHEN 'Description' THEN '[IDM_Customers].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Customers].[Description] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_Customers].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_Customers].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_Customers].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_Customers].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_Customers].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_Customers].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_Customers].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_Customers].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_Customers].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_Customers].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_Customers].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_Customers].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_Customers].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_Customers].[Address4] DESC'
                        WHEN 'ToEMailID' THEN '[IDM_Customers].[ToEMailID]'
                        WHEN 'ToEMailID DESC' THEN '[IDM_Customers].[ToEMailID] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_Customers].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_Customers].[CCEmailID] DESC'
                        ELSE '[IDM_Customers].[CustomerID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_Customers].[CustomerID] ,
		[IDM_Customers].[Description] ,
		[IDM_Customers].[ContactPerson] ,
		[IDM_Customers].[EmailID] ,
		[IDM_Customers].[ContactNo] ,
		[IDM_Customers].[Address1] ,
		[IDM_Customers].[Address2] ,
		[IDM_Customers].[Address3] ,
		[IDM_Customers].[Address4] ,
		[IDM_Customers].[ToEMailID] ,
		[IDM_Customers].[CCEmailID]  
  FROM [IDM_Customers] 
    	INNER JOIN #PageIndex
          ON [IDM_Customers].[CustomerID] = #PageIndex.CustomerID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
