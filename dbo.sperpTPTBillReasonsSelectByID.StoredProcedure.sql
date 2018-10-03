USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillReasonsSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
		[ERP_TPTBillReasons].[ReasonID] ,
		[ERP_TPTBillReasons].[Description]  
  FROM [ERP_TPTBillReasons] 
  WHERE
  [ERP_TPTBillReasons].[ReasonID] = @ReasonID
GO
