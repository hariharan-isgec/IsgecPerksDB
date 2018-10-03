USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeInsert]
  @TranType NVarChar(3),
  @Description NVarChar(30),
  @Return_TranType NVarChar(3) = null OUTPUT
  AS
  INSERT [ATN_TranType]
  (
   [TranType]
  ,[Description]
  )
  VALUES
  (
   @TranType
  ,@Description
  )
  SET @Return_TranType = @TranType
GO
