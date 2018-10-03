USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesDelete]
  @Original_ResponsibleAgencyID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_ResponsibleAgencies]
  WHERE
  [PAK_ResponsibleAgencies].[ResponsibleAgencyID] = @Original_ResponsibleAgencyID
  SET @RowCount = @@RowCount
GO
