USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomerContactsSelectListFilteres]
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CustomerID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_CustomerContacts].[CustomerID]'
  SET @LGSQL = @LGSQL + ', [IDM_CustomerContacts].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_CustomerContacts] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Customers] AS [IDM_Customers1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_CustomerContacts].[CustomerID] = [IDM_Customers1].[CustomerID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CustomerID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_CustomerContacts].[CustomerID] = ''' + @Filter_CustomerID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CustomerID' THEN '[IDM_CustomerContacts].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[IDM_CustomerContacts].[CustomerID] DESC'
                        WHEN 'SerialNo' THEN '[IDM_CustomerContacts].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[IDM_CustomerContacts].[SerialNo] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_CustomerContacts].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_CustomerContacts].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_CustomerContacts].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_CustomerContacts].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_CustomerContacts].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_CustomerContacts].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_CustomerContacts].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_CustomerContacts].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_CustomerContacts].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_CustomerContacts].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_CustomerContacts].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_CustomerContacts].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_CustomerContacts].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_CustomerContacts].[Address4] DESC'
                        WHEN 'Remarks' THEN '[IDM_CustomerContacts].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[IDM_CustomerContacts].[Remarks] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_CustomerContacts].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_CustomerContacts].[CCEmailID] DESC'
                        WHEN 'IDM_Customers1_Description' THEN '[IDM_Customers].[Description]'
                        WHEN 'IDM_Customers1_Description DESC' THEN '[IDM_Customers1].[Description] DESC'
                        ELSE '[IDM_CustomerContacts].[CustomerID],[IDM_CustomerContacts].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_CustomerContacts].[CustomerID] ,
		[IDM_CustomerContacts].[SerialNo] ,
		[IDM_CustomerContacts].[ContactPerson] ,
		[IDM_CustomerContacts].[EmailID] ,
		[IDM_CustomerContacts].[ContactNo] ,
		[IDM_CustomerContacts].[Address1] ,
		[IDM_CustomerContacts].[Address2] ,
		[IDM_CustomerContacts].[Address3] ,
		[IDM_CustomerContacts].[Address4] ,
		[IDM_CustomerContacts].[Remarks] ,
		[IDM_CustomerContacts].[CCEmailID] ,
		[IDM_Customers1].[Description] AS IDM_Customers1_Description 
  FROM [IDM_CustomerContacts] 
    	INNER JOIN #PageIndex
          ON [IDM_CustomerContacts].[CustomerID] = #PageIndex.CustomerID
          AND [IDM_CustomerContacts].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [IDM_Customers] AS [IDM_Customers1]
    ON [IDM_CustomerContacts].[CustomerID] = [IDM_Customers1].[CustomerID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
