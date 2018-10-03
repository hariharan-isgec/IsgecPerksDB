USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpntProjectsSelectByID]
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[IDM_Projects].[ProjectID] ,
		[IDM_Projects].[Description] ,
		[IDM_Projects].[CustomerOrderReference] ,
		[IDM_Projects].[ContactPerson] ,
		[IDM_Projects].[EmailID] ,
		[IDM_Projects].[ContactNo] ,
		[IDM_Projects].[Address1] ,
		[IDM_Projects].[Address2] ,
		[IDM_Projects].[Address3] ,
		[IDM_Projects].[Address4] ,
		[IDM_Projects].[ToEMailID] ,
		[IDM_Projects].[CCEmailID]  
  FROM [IDM_Projects] 
  WHERE
  [IDM_Projects].[ProjectID] = @ProjectID
GO
