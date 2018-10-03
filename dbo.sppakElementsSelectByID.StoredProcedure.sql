USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsSelectByID]
  @LoginID NVarChar(8),
  @ElementID NVarChar(8) 
  AS
  SELECT
    [PAK_Elements].* ,
    [PAK_Elements1].[Description] AS PAK_Elements1_Description,
    [PAK_ResponsibleAgencies2].[Description] AS PAK_ResponsibleAgencies2_Description 
  FROM [PAK_Elements] 
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements1]
    ON [PAK_Elements].[ParentElementID] = [PAK_Elements1].[ElementID]
  LEFT OUTER JOIN [PAK_ResponsibleAgencies] AS [PAK_ResponsibleAgencies2]
    ON [PAK_Elements].[ResponsibleAgencyID] = [PAK_ResponsibleAgencies2].[ResponsibleAgencyID]
  WHERE
  [PAK_Elements].[ElementID] = @ElementID
GO
