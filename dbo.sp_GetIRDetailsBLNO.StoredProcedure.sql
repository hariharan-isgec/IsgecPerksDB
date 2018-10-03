USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetIRDetailsBLNO]
@IRNO varchar(20)
AS
BEGIN

DECLARE @BLNO varchar(20)
SET @BLNO=(SELECT BLID FROM ELOG_IRBL WHERE IRNO=@IRNO)


SELECT IRNO  as ReferemceIRNo,T2.Description as ChargeHead,T3.description as ChargeheadDiscription,Amount
                FROM ELOG_IRBLDetails T1
                INNER JOIN ELOG_ChargeTypes T2 ON T2.ChargeTypeID=T1.ChargeTypeID
                INNER JOIN ELOG_ChargeCodes T3 ON T3.ChargeCodeID=T1.ChargeCodeID
                WHERE IRNO in (SELECT IRNO from ELOG_IRBL WHERE BLID=@BLNO and IRNO!=@IRNO)
                
                END
GO
