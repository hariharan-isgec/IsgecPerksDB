USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_PORevisions]
as
SELECT  
OrderNo 		as OrderNo			,
RevisionNo as RevisionNo,
ReasonCode as ReasonCode,
ReasonRemarks as ReasonRemarks
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno      as OrderNo     ,        
t$rvno     as RevisionNo,
t$cred     as ReasonCode,
t$rema as ReasonRemarks
FROM baandb.ttdpur962200
') ;
GO
