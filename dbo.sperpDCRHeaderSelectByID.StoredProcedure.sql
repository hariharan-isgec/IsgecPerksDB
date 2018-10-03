USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderSelectByID]
  @LoginID NVarChar(8),
  @DCRNo NVarChar(10) 
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
  WHERE
  [ERP_DCRHeader].[DCRNo] = @DCRNo
GO
