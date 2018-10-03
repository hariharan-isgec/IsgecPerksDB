USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorContactsSelectListFilteres]
  @Filter_VendorID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VendorID NVarChar(6) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VendorID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_VendorContacts].[VendorID]'
  SET @LGSQL = @LGSQL + ', [IDM_VendorContacts].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_VendorContacts] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Vendors] AS [IDM_Vendors1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_VendorContacts].[VendorID] = [IDM_Vendors1].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_VendorContacts].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VendorID' THEN '[IDM_VendorContacts].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[IDM_VendorContacts].[VendorID] DESC'
                        WHEN 'SerialNo' THEN '[IDM_VendorContacts].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[IDM_VendorContacts].[SerialNo] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_VendorContacts].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_VendorContacts].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_VendorContacts].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_VendorContacts].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_VendorContacts].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_VendorContacts].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_VendorContacts].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_VendorContacts].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_VendorContacts].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_VendorContacts].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_VendorContacts].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_VendorContacts].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_VendorContacts].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_VendorContacts].[Address4] DESC'
                        WHEN 'Remarks' THEN '[IDM_VendorContacts].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[IDM_VendorContacts].[Remarks] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_VendorContacts].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_VendorContacts].[CCEmailID] DESC'
                        WHEN 'IDM_Vendors1_Description' THEN '[IDM_Vendors].[Description]'
                        WHEN 'IDM_Vendors1_Description DESC' THEN '[IDM_Vendors1].[Description] DESC'
                        ELSE '[IDM_VendorContacts].[VendorID],[IDM_VendorContacts].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_VendorContacts].[VendorID] ,
		[IDM_VendorContacts].[SerialNo] ,
		[IDM_VendorContacts].[ContactPerson] ,
		[IDM_VendorContacts].[EmailID] ,
		[IDM_VendorContacts].[ContactNo] ,
		[IDM_VendorContacts].[Address1] ,
		[IDM_VendorContacts].[Address2] ,
		[IDM_VendorContacts].[Address3] ,
		[IDM_VendorContacts].[Address4] ,
		[IDM_VendorContacts].[Remarks] ,
		[IDM_VendorContacts].[CCEmailID] ,
		[IDM_Vendors1].[Description] AS IDM_Vendors1_Description 
  FROM [IDM_VendorContacts] 
    	INNER JOIN #PageIndex
          ON [IDM_VendorContacts].[VendorID] = #PageIndex.VendorID
          AND [IDM_VendorContacts].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors1]
    ON [IDM_VendorContacts].[VendorID] = [IDM_Vendors1].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
