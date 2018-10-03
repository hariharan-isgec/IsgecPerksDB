USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesSelectByID]
  @TmtlTypeID NVarChar(2) 
  AS
  SELECT
		[IDM_TransmittalTypes].[TmtlTypeID] ,
		[IDM_TransmittalTypes].[Description]  
  FROM [IDM_TransmittalTypes] 
  WHERE
  [IDM_TransmittalTypes].[TmtlTypeID] = @TmtlTypeID
GO
