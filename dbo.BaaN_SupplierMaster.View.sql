USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[BaaN_SupplierMaster]
as
SELECT 
			SupplierCode,
			SupplierName,
			SupplierGroup
FROM 
OPENQUERY([BAAN],
'SELECT 
			t$suno as SupplierCode,
			t$nama as SupplierName,
			t$cfsg as SupplierGroup
FROM ttccom020100
');
GO
