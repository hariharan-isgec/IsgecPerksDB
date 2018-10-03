USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBusinessPartnerDelete]
  @Original_BPID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_BusinessPartner]
  WHERE
  [VR_BusinessPartner].[BPID] = @Original_BPID
  SET @RowCount = @@RowCount
GO
