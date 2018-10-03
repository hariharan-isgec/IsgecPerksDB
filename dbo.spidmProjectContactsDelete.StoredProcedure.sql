USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_ProjectContacts]
  WHERE
  [IDM_ProjectContacts].[ProjectID] = @Original_ProjectID
  AND [IDM_ProjectContacts].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
