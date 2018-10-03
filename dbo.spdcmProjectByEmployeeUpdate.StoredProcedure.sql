USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeUpdate]
  @Original_RecordID Int, 
  @CardNo NVarChar(8),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_ProjectByEmployee] SET 
   [CardNo] = @CardNo
  ,[ProjectID] = @ProjectID
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
