USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_WebPay_tmp]
AS
SELECT  a.CardNo, 
        a.EmployeeName, 
        a.C_DateofJoining as JDT, 
        a.C_DateOfReleaving As RDT,
        a.ActiveState,  
        (case C_OfficeID when 6 then 'Site' else 'Office' end) as Location, 
        isnull((select sum(tmp.FinalValue) from atn_attendance as tmp 
                where tmp.finyear=2016 and month(tmp.attendate)= 4 
                and tmp.cardno=a.cardno),0) AS PR_April,
        isnull((select PD_LastMonth FROM OPENQUERY(WEBPAY,
						'SELECT    fk_Emp_Code As CardNo, PaidDays As PD_LastMonth
						FROM      SalaryOtherDetails 
						WHERE     mm = 4 AND YYYY = 2016'              
            ) 
               where CardNo=a.CardNo) 
				,0) as PD_April   
FROM    hrm_employees as a  
where (C_DateOfReleaving > convert(datetime,'31/05/2016',103) OR C_DateofReleaving is NULL) 
       and (a.cardno < '9000' or a.cardno in ('9883','9744','9010'))
GO
