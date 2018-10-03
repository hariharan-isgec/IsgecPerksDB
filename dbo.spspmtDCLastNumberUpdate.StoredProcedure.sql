USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberUpdate]
  @Original_NumberID Int, 
  @Description NVarChar(50),
  @LastNumber Int,
  @Year Int,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_DCLastNumber] SET 
   [Description] = @Description
  ,[LastNumber] = @LastNumber
  ,[Year] = @Year
  ,[Active] = @Active
  WHERE
  [NumberID] = @Original_NumberID
  SET @RowCount = @@RowCount
GO
