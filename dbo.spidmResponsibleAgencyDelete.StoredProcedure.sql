USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmResponsibleAgencyDelete]
  @Original_ResponsibleAgencyID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_ResponsibleAgency]
  WHERE
  [IDM_ResponsibleAgency].[ResponsibleAgencyID] = @Original_ResponsibleAgencyID
  SET @RowCount = @@RowCount
GO
