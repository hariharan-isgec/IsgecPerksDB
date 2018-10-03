USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomProjectsSelectByID]
  @FinanceCompany NVarChar(10) ='',
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[IDM_Projects].* ,
		[IDM_Customers1].[Description] AS IDM_Customers1_Description 
  FROM [IDM_Projects] 
  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers1]
    ON [IDM_Projects].[CustomerID] = [IDM_Customers1].[CustomerID]
  WHERE [IDM_Projects].[ProjectID] = @ProjectID
   --AND  [IDM_Projects].[FinanceCompany] = case when @FinanceCompany='' then [IDM_Projects].[FinanceCompany] else @FinanceCompany end
GO
