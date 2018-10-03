USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodInsert]
  @CalculationTypeID NVarChar(10),
  @CalculationDescription NVarChar(50),
  @Return_CalculationTypeID NVarChar(10) = null OUTPUT 
  AS
  INSERT [TA_CalcMethod]
  (
   [CalculationTypeID]
  ,[CalculationDescription]
  )
  VALUES
  (
   UPPER(@CalculationTypeID)
  ,@CalculationDescription
  )
  SET @Return_CalculationTypeID = @CalculationTypeID
GO
