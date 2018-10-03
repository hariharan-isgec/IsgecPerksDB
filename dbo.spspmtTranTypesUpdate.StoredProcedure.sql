USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesUpdate]
  @Original_TranTypeID NVarChar(3), 
  @TranTypeID NVarChar(3),
  @Description NVarChar(30),
  @GroupID NVarChar(6),
  @BaaNCompany NVarChar(10),
  @BaaNLedger NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_TranTypes] SET 
   [TranTypeID] = @TranTypeID
  ,[Description] = @Description
  ,[GroupID] = @GroupID
  ,[BaaNCompany] = @BaaNCompany
  ,[BaaNLedger] = @BaaNLedger
  WHERE
  [TranTypeID] = @Original_TranTypeID
  SET @RowCount = @@RowCount
GO
