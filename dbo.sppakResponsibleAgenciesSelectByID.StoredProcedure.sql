USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesSelectByID]
  @LoginID NVarChar(8),
  @ResponsibleAgencyID Int 
  AS
  SELECT
    [PAK_ResponsibleAgencies].*  
  FROM [PAK_ResponsibleAgencies] 
  WHERE
  [PAK_ResponsibleAgencies].[ResponsibleAgencyID] = @ResponsibleAgencyID
GO
