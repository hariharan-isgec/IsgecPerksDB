USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderSelectListFilteres]
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
 ,DCRNo NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DCRNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_DCRHeader].[DCRNo]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_DCRHeader] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DCRNo' THEN '[ERP_DCRHeader].[DCRNo]'
                        WHEN 'DCRNo DESC' THEN '[ERP_DCRHeader].[DCRNo] DESC'
                        WHEN 'DCRDate' THEN '[ERP_DCRHeader].[DCRDate]'
                        WHEN 'DCRDate DESC' THEN '[ERP_DCRHeader].[DCRDate] DESC'
                        WHEN 'DCRDescription' THEN '[ERP_DCRHeader].[DCRDescription]'
                        WHEN 'DCRDescription DESC' THEN '[ERP_DCRHeader].[DCRDescription] DESC'
                        WHEN 'CreatedBy' THEN '[ERP_DCRHeader].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[ERP_DCRHeader].[CreatedBy] DESC'
                        WHEN 'CreatedName' THEN '[ERP_DCRHeader].[CreatedName]'
                        WHEN 'CreatedName DESC' THEN '[ERP_DCRHeader].[CreatedName] DESC'
                        WHEN 'CreatedEMail' THEN '[ERP_DCRHeader].[CreatedEMail]'
                        WHEN 'CreatedEMail DESC' THEN '[ERP_DCRHeader].[CreatedEMail] DESC'
                        WHEN 'ProjectID' THEN '[ERP_DCRHeader].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[ERP_DCRHeader].[ProjectID] DESC'
                        WHEN 'ProjectDescription' THEN '[ERP_DCRHeader].[ProjectDescription]'
                        WHEN 'ProjectDescription DESC' THEN '[ERP_DCRHeader].[ProjectDescription] DESC'
                        ELSE '[ERP_DCRHeader].[DCRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_DCRHeader].[DCRNo] ,
		[ERP_DCRHeader].[DCRDate] ,
		[ERP_DCRHeader].[DCRDescription] ,
		[ERP_DCRHeader].[CreatedBy] ,
		[ERP_DCRHeader].[CreatedName] ,
		[ERP_DCRHeader].[CreatedEMail] ,
		[ERP_DCRHeader].[ProjectID] ,
		[ERP_DCRHeader].[ProjectDescription]  
  FROM [ERP_DCRHeader] 
    	INNER JOIN #PageIndex
          ON [ERP_DCRHeader].[DCRNo] = #PageIndex.DCRNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
