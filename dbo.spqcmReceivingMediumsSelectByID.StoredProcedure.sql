USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsSelectByID]
  @LoginID NVarChar(8),
  @ReceivingMediumID Int 
  AS
  SELECT
		[QCM_ReceivingMediums].[ReceivingMediumID] ,
		[QCM_ReceivingMediums].[Description]  
  FROM [QCM_ReceivingMediums] 
  WHERE
  [QCM_ReceivingMediums].[ReceivingMediumID] = @ReceivingMediumID
GO
