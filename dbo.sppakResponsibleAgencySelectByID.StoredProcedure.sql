USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencySelectByID]
  @LoginID NVarChar(8),
  @ResponsibleAgencyID Int 
  AS
  SELECT
    [IDM_ResponsibleAgency].*  
  FROM [IDM_ResponsibleAgency] 
  WHERE
  [IDM_ResponsibleAgency].[ResponsibleAgencyID] = @ResponsibleAgencyID
GO
