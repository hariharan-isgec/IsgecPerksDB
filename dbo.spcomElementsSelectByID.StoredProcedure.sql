USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spcomElementsSelectByID]
  @WBSID NVarChar(8) 
  AS
  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel]  
  FROM [IDM_WBS] 
  WHERE
  [IDM_WBS].[WBSID] = @WBSID
GO
