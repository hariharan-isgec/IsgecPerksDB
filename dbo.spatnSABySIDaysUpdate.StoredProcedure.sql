USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDaysUpdate]
  @Original_SerialNo Int, 
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @D01 NVarChar(2),
  @D02 NVarChar(2),
  @D03 NVarChar(2),
  @D04 NVarChar(2),
  @D05 NVarChar(2),
  @D06 NVarChar(2),
  @D07 NVarChar(2),
  @D08 NVarChar(2),
  @D09 NVarChar(2),
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
  @SerialNo Int,
  @Remarks NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_SABySIDays] SET 
   [CardNo] = @CardNo
  ,[D01] = @D01
  ,[D02] = @D02
  ,[D03] = @D03
  ,[D04] = @D04
  ,[D05] = @D05
  ,[D06] = @D06
  ,[D07] = @D07
  ,[D08] = @D08
  ,[D09] = @D09
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
  ,[SerialNo] = @SerialNo
  ,[Remarks] = @Remarks
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
