USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmVendorsSelectListFilteres]
  @Filter_VendorID NVarChar(9),
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
 ,VendorID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VendorID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Vendors].[VendorID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Vendors] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Vendors].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VendorID' THEN '[IDM_Vendors].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[IDM_Vendors].[VendorID] DESC'
                        WHEN 'Description' THEN '[IDM_Vendors].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Vendors].[Description] DESC'
                        WHEN 'ContactPerson' THEN '[IDM_Vendors].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[IDM_Vendors].[ContactPerson] DESC'
                        WHEN 'EmailID' THEN '[IDM_Vendors].[EmailID]'
                        WHEN 'EmailID DESC' THEN '[IDM_Vendors].[EmailID] DESC'
                        WHEN 'ContactNo' THEN '[IDM_Vendors].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[IDM_Vendors].[ContactNo] DESC'
                        WHEN 'Address1' THEN '[IDM_Vendors].[Address1]'
                        WHEN 'Address1 DESC' THEN '[IDM_Vendors].[Address1] DESC'
                        WHEN 'Address2' THEN '[IDM_Vendors].[Address2]'
                        WHEN 'Address2 DESC' THEN '[IDM_Vendors].[Address2] DESC'
                        WHEN 'Address3' THEN '[IDM_Vendors].[Address3]'
                        WHEN 'Address3 DESC' THEN '[IDM_Vendors].[Address3] DESC'
                        WHEN 'Address4' THEN '[IDM_Vendors].[Address4]'
                        WHEN 'Address4 DESC' THEN '[IDM_Vendors].[Address4] DESC'
                        WHEN 'ToEMailID' THEN '[IDM_Vendors].[ToEMailID]'
                        WHEN 'ToEMailID DESC' THEN '[IDM_Vendors].[ToEMailID] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_Vendors].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_Vendors].[CCEmailID] DESC'
                        ELSE '[IDM_Vendors].[VendorID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_Vendors].[VendorID] ,
		[IDM_Vendors].[Description] ,
		[IDM_Vendors].[ContactPerson] ,
		[IDM_Vendors].[EmailID] ,
		[IDM_Vendors].[ContactNo] ,
		[IDM_Vendors].[Address1] ,
		[IDM_Vendors].[Address2] ,
		[IDM_Vendors].[Address3] ,
		[IDM_Vendors].[Address4] ,
		[IDM_Vendors].[ToEMailID] ,
		[IDM_Vendors].[CCEmailID]  
  FROM [IDM_Vendors] 
    	INNER JOIN #PageIndex
          ON [IDM_Vendors].[VendorID] = #PageIndex.VendorID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
