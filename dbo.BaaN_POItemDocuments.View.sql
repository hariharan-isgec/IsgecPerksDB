USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_POItemDocuments]
AS
SELECT  
ProjectCode as ProjectCode,
ElementCode as ElementCode,
PuchaseOrder as PurchaseOrder,
PurchaseorderRevision as PurchaseOrderRevision,
PurchaseOrderLine as PurchaseOrderLine,
ItemCode as ItemCode,
DocumentNo as DocumentNo,
DocumentRevision as DocumentRevision
FROM  OPENQUERY(baan,  
'SELECT  
ttppdm973100.t$cprj as ProjectCode,
ttdpur041100.t$cspa as ElementCode,
ttppdm973100.t$orno as PuchaseOrder,
ttppdm973100.t$rvno as PurchaseorderRevision,
ttppdm973100.t$pono as PurchaseOrderLine,
ttppdm973100.t$item as ItemCode,
ttppdm973100.t$cdoc as DocumentNo,
ttppdm973100.t$drno as DocumentRevision
FROM  ttppdm973100, ttdpur041100
where ttppdm973100.t$orno = ttdpur041100.t$orno
and ttppdm973100.t$pono = ttdpur041100.t$pono
')
GO
