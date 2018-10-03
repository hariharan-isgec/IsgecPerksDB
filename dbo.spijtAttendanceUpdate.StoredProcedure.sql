USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceUpdate]
  @Original_RecordID Int, 
  @D1 NVarChar(2),
  @D2 NVarChar(2),
  @D3 NVarChar(2),
  @D4 NVarChar(2),
  @D5 NVarChar(2),
  @D6 NVarChar(2),
  @D7 NVarChar(2),
  @D8 NVarChar(2),
  @D9 NVarChar(2),
  @D10 NVarChar(2),
  @D11 NVarChar(2),
  @D12 NVarChar(2),
  @D13 NVarChar(2),
  @D14 NVarChar(2),
  @D15 NVarChar(2),
  @D16 NVarChar(2),
  @D17 NVarChar(2),
  @D18 NVarChar(2),
  @D19 NVarChar(2),
  @D20 NVarChar(2),
  @D21 NVarChar(2),
  @D22 NVarChar(2),
  @D23 NVarChar(2),
  @D24 NVarChar(2),
  @D25 NVarChar(2),
  @D26 NVarChar(2),
  @D27 NVarChar(2),
  @D28 NVarChar(2),
  @D29 NVarChar(2),
  @D30 NVarChar(2),
  @D31 NVarChar(2),
  @Locked Bit,
  @Remarks NVarChar(255),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IJT_Attendance] SET 
   [D1] = @D1
  ,[D2] = @D2
  ,[D3] = @D3
  ,[D4] = @D4
  ,[D5] = @D5
  ,[D6] = @D6
  ,[D7] = @D7
  ,[D8] = @D8
  ,[D9] = @D9
  ,[D10] = @D10
  ,[D11] = @D11
  ,[D12] = @D12
  ,[D13] = @D13
  ,[D14] = @D14
  ,[D15] = @D15
  ,[D16] = @D16
  ,[D17] = @D17
  ,[D18] = @D18
  ,[D19] = @D19
  ,[D20] = @D20
  ,[D21] = @D21
  ,[D22] = @D22
  ,[D23] = @D23
  ,[D24] = @D24
  ,[D25] = @D25
  ,[D26] = @D26
  ,[D27] = @D27
  ,[D28] = @D28
  ,[D29] = @D29
  ,[D30] = @D30
  ,[D31] = @D31
  ,[Locked] = @Locked
  ,[Remarks] = @Remarks
  ,[ProjectID] = @ProjectID
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
