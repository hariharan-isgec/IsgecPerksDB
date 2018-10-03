USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesInsert]
  @TranTypeID NVarChar(3),
  @Description NVarChar(30),
  @GroupID NVarChar(6),
  @BaaNCompany NVarChar(10),
  @BaaNLedger NVarChar(20),
  @Return_TranTypeID NVarChar(3) = null OUTPUT 
  AS
  INSERT [SPMT_TranTypes]
  (
   [TranTypeID]
  ,[Description]
  ,[GroupID]
  ,[BaaNCompany]
  ,[BaaNLedger]
  )
  VALUES
  (
   UPPER(@TranTypeID)
  ,@Description
  ,@GroupID
  ,@BaaNCompany
  ,@BaaNLedger
  )
  SET @Return_TranTypeID = @TranTypeID
GO
