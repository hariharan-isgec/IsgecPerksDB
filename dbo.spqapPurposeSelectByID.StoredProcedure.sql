USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeSelectByID]
  @LoginID NVarChar(8),
  @PurposeID Int 
  AS
  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
  WHERE
  [QAP_Purpose].[PurposeID] = @PurposeID
GO
