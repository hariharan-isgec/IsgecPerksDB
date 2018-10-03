USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCurrenciesInsert]
  @CurrencyID NVarChar(6),
  @CurrencyName NVarChar(50),
  @Return_CurrencyID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TA_Currencies]
  (
   [CurrencyID]
  ,[CurrencyName]
  )
  VALUES
  (
   UPPER(@CurrencyID)
  ,@CurrencyName
  )
  SET @Return_CurrencyID = @CurrencyID
GO
