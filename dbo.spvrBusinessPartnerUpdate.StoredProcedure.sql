USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBusinessPartnerUpdate]
  @Original_BPID NVarChar(9), 
  @BPID NVarChar(9),
  @BPName NVarChar(100),
  @Address1Line NVarChar(100),
  @Address2Line NVarChar(100),
  @City NVarChar(50),
  @EMailID NVarChar(200),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_BusinessPartner] SET 
   [BPID] = @BPID
  ,[BPName] = @BPName
  ,[Address1Line] = @Address1Line
  ,[Address2Line] = @Address2Line
  ,[City] = @City
  ,[EMailID] = @EMailID
  WHERE
  [BPID] = @Original_BPID
  SET @RowCount = @@RowCount
GO
