USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencyUpdate]
  @Original_ResponsibleAgencyID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_ResponsibleAgency] SET 
   [Description] = @Description
  WHERE
  [ResponsibleAgencyID] = @Original_ResponsibleAgencyID
  SET @RowCount = @@RowCount
GO
