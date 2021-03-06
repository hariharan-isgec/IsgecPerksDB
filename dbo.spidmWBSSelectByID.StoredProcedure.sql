USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmWBSSelectByID]
  @WBSID NVarChar(8) 
  AS
  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel] ,
		[IDM_WBS].[ResponsibleAgencyID] ,
		[IDM_ResponsibleAgency1].[Description] AS IDM_ResponsibleAgency1_Description 
  FROM [IDM_WBS] 
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency1]
    ON [IDM_WBS].[ResponsibleAgencyID] = [IDM_ResponsibleAgency1].[ResponsibleAgencyID]
  WHERE
  [IDM_WBS].[WBSID] = @WBSID
GO
