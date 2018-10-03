USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesUpdate]
  @Original_ResponsibleAgencyID Int, 
  @Description NVarChar(50),
  @ExternalAgency Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_ResponsibleAgencies] SET 
   [Description] = @Description
  ,[ExternalAgency] = @ExternalAgency
  WHERE
  [ResponsibleAgencyID] = @Original_ResponsibleAgencyID
  SET @RowCount = @@RowCount
GO
