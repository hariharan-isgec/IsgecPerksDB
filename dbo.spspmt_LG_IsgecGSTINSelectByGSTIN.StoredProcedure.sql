USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spspmt_LG_IsgecGSTINSelectByGSTIN]
  @LoginID NVarChar(8),
  @GSTIN NVarChar(50)  
  AS
  SELECT
    [SPMT_IsgecGSTIN].*  
  FROM [SPMT_IsgecGSTIN] 
  WHERE
  [SPMT_IsgecGSTIN].[Description] = @GSTIN
GO
