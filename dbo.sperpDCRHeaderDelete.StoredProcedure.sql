USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRHeaderDelete]
  @Original_DCRNo NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_DCRHeader]
  WHERE
  [ERP_DCRHeader].[DCRNo] = @Original_DCRNo
  SET @RowCount = @@RowCount
GO
