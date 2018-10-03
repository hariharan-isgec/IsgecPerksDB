USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnCardReplacementInsert]
  @ReplacedCardNo NVarChar(8),
  @CardNo NVarChar(8),
  @Return_ReplacedCardNo NVarChar(8) = null OUTPUT
  AS
  INSERT [ATN_CardReplacement]
  (
   [ReplacedCardNo]
  ,[CardNo]
  )
  VALUES
  (
   @ReplacedCardNo
  ,@CardNo
  )
  SET @Return_ReplacedCardNo = @ReplacedCardNo
GO
