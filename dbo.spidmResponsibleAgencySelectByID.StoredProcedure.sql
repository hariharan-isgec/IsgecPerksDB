USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmResponsibleAgencySelectByID]
  @ResponsibleAgencyID Int 
  AS
  SELECT
		[IDM_ResponsibleAgency].[ResponsibleAgencyID] ,
		[IDM_ResponsibleAgency].[Description]  
  FROM [IDM_ResponsibleAgency] 
  WHERE
  [IDM_ResponsibleAgency].[ResponsibleAgencyID] = @ResponsibleAgencyID
GO
