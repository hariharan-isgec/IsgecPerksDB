USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTDDelete]
  @Original_TmtlID Int,
  @Original_ProjectID NVarChar(6),
  @Original_DocumentID NVarChar(30),
  @Original_RevisionNo NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_TransmittalDetail]
  WHERE
  [IDM_TransmittalDetail].[TmtlID] = @Original_TmtlID
  AND [IDM_TransmittalDetail].[ProjectID] = @Original_ProjectID
  AND [IDM_TransmittalDetail].[DocumentID] = @Original_DocumentID
  AND [IDM_TransmittalDetail].[RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
