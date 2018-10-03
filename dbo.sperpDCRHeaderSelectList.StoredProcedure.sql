USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  WHERE 1 = 1  
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
GO
