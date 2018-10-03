USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesSelectByID]
  @LoginID NVarChar(8),
  @RequestTypeID Int 
  AS
  SELECT
		[ERP_RequestTypes].[RequestTypeID] ,
		[ERP_RequestTypes].[Description]  
  FROM [ERP_RequestTypes] 
  WHERE
  [ERP_RequestTypes].[RequestTypeID] = @RequestTypeID
GO
