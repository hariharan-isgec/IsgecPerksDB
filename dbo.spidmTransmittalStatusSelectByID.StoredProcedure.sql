USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusSelectByID]
  @TmtlStatusID Int 
  AS
  SELECT
		[IDM_TransmittalStatus].[TmtlStatusID] ,
		[IDM_TransmittalStatus].[Description]  
  FROM [IDM_TransmittalStatus] 
  WHERE
  [IDM_TransmittalStatus].[TmtlStatusID] = @TmtlStatusID
GO
