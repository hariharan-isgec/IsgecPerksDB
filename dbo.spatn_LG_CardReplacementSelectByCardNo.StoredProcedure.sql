USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spatn_LG_CardReplacementSelectByCardNo]
  @CardNo NVarChar(8)
  AS
  SELECT
		[ATN_CardReplacement].[ReplacedCardNo],
		[ATN_CardReplacement].[CardNo]
  FROM [ATN_CardReplacement] 
  WHERE
  [ATN_CardReplacement].[CardNo] = @CardNo
GO
