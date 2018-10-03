USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_SupplierBill_Containers]
AS
SELECT  IRNo,
				ContainerNo,
				ContainerRemarks,
				ContainerAmount,
				ContainerType_d,
				ContainerType_u   
FROM  OPENQUERY(baan,  
'SELECT   
     ttploc956100.t$ninv as IRNo, 
     ttploc956100.t$cntr as ContainerNo,
     trim(ttploc956100.t$rema) as ContainerRemarks,
     ttploc956100.t$amnt as ContainerAmount,
     ttploc956100.t$refcntd as ContainerType_d, 
     ttploc956100.t$refcntu as ContainerType_u
  FROM  ttploc956100         
') AS SupplierBillsContainers
GO
