USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderUpdate]
  @Original_TmtlID Int, 
  @Original_ProjectID NVarChar(6), 
  @Original_CustomerID NVarChar(6), 
  @TmtlReference NVarChar(30),
  @Subject NVarChar(500),
  @Remarks NVarChar(1000),
  @TmtlStatusID NVarChar(1),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_CustomerTmtlHeader] SET 
   [TmtlReference] = @TmtlReference
  ,[Subject] = @Subject
  ,[Remarks] = @Remarks
  ,[TmtlStatusID] = @TmtlStatusID
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  WHERE
  [TmtlID] = @Original_TmtlID
  AND [ProjectID] = @Original_ProjectID
  AND [CustomerID] = @Original_CustomerID
  SET @RowCount = @@RowCount
GO
