USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spvpnAccessDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VPN_ConnectivityAccess]
  WHERE
  [VPN_ConnectivityAccess].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
