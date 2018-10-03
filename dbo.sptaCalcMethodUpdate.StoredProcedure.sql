USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodUpdate]
  @Original_CalculationTypeID NVarChar(10), 
  @CalculationTypeID NVarChar(10),
  @CalculationDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_CalcMethod] SET 
   [CalculationTypeID] = @CalculationTypeID
  ,[CalculationDescription] = @CalculationDescription
  WHERE
  [CalculationTypeID] = @Original_CalculationTypeID
  SET @RowCount = @@RowCount
GO
