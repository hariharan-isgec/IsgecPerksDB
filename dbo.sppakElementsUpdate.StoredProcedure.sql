USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsUpdate]
  @Original_ElementID NVarChar(8), 
  @ElementID NVarChar(8),
  @Description NVarChar(100),
  @ResponsibleAgencyID Int,
  @ParentElementID NVarChar(8),
  @ElementLevel Int,
  @Prefix NVarChar(1000),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Elements] SET 
   [ElementID] = @ElementID
  ,[Description] = @Description
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  ,[ParentElementID] = @ParentElementID
  ,[ElementLevel] = @ElementLevel
  ,[Prefix] = @Prefix
  WHERE
  [ElementID] = @Original_ElementID
  SET @RowCount = @@RowCount
GO
