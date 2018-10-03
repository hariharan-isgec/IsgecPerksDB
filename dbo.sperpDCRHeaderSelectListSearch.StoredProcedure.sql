USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderSelectListSearch]
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
 ,DCRNo NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (DCRNo)
  SELECT [ERP_DCRHeader].[DCRNo] FROM [ERP_DCRHeader]
 WHERE  
   ( 
         LOWER(ISNULL([ERP_DCRHeader].[DCRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[DCRDate],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[DCRDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[CreatedName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[CreatedEMail],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRHeader].[ProjectDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DCRNo' THEN [ERP_DCRHeader].[DCRNo] END,
     CASE @OrderBy WHEN 'DCRNo DESC' THEN [ERP_DCRHeader].[DCRNo] END DESC,
     CASE @OrderBy WHEN 'DCRDate' THEN [ERP_DCRHeader].[DCRDate] END,
     CASE @OrderBy WHEN 'DCRDate DESC' THEN [ERP_DCRHeader].[DCRDate] END DESC,
     CASE @OrderBy WHEN 'DCRDescription' THEN [ERP_DCRHeader].[DCRDescription] END,
     CASE @OrderBy WHEN 'DCRDescription DESC' THEN [ERP_DCRHeader].[DCRDescription] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [ERP_DCRHeader].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [ERP_DCRHeader].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedName' THEN [ERP_DCRHeader].[CreatedName] END,
     CASE @OrderBy WHEN 'CreatedName DESC' THEN [ERP_DCRHeader].[CreatedName] END DESC,
     CASE @OrderBy WHEN 'CreatedEMail' THEN [ERP_DCRHeader].[CreatedEMail] END,
     CASE @OrderBy WHEN 'CreatedEMail DESC' THEN [ERP_DCRHeader].[CreatedEMail] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [ERP_DCRHeader].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [ERP_DCRHeader].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProjectDescription' THEN [ERP_DCRHeader].[ProjectDescription] END,
     CASE @OrderBy WHEN 'ProjectDescription DESC' THEN [ERP_DCRHeader].[ProjectDescription] END DESC 

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
