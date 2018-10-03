USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakWBSUpdate]
  @Original_WBSID NVarChar(8), 
  @WBSID NVarChar(8),
  @Description NVarChar(50),
  @WBSLevel Int,
  @ResponsibleAgencyID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_WBS] SET 
   [WBSID] = @WBSID
  ,[Description] = @Description
  ,[WBSLevel] = @WBSLevel
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  WHERE
  [WBSID] = @Original_WBSID
  SET @RowCount = @@RowCount
GO
