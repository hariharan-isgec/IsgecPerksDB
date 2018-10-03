USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(2), 
  @Description NVarChar(100),
  @Locked Bit,
  @TmtlID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_Documents] SET 
   [Description] = @Description
  ,[Locked] = @Locked
  ,[TmtlID] = @TmtlID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
