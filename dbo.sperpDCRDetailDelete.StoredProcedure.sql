USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailDelete]
  @Original_DCRNo NVarChar(10),
  @Original_DocumentID NVarChar(30),
  @Original_RevisionNo NVarChar(5),
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_DCRDetail]
  WHERE
  [ERP_DCRDetail].[DCRNo] = @Original_DCRNo
  AND [ERP_DCRDetail].[DocumentID] = @Original_DocumentID
  AND [ERP_DCRDetail].[RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
