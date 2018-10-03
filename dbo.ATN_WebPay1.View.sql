USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_WebPay1]
AS
SELECT  a.CardNo, 
        a.EmployeeName, 
        a.C_DateofJoining as JDT, 
        a.C_DateOfReleaving As RDT,
        a.ActiveState,  
        (case C_OfficeID when 6 then 'Site' else 'Office' end) as Location, 
        isnull((select sum(tmp.FinalValue) from atn_attendance as tmp 
                where tmp.finyear=2016 and month(tmp.attendate)= 5 
                and tmp.cardno=a.cardno),0) AS PR_LastMonth,
        isnull((select PD_LastMonth FROM OPENQUERY(WEBPAY,
						'SELECT    fk_Emp_Code As CardNo, PaidDays As PD_LastMonth
						FROM      SalaryOtherDetails 
						WHERE     mm = 5 AND YYYY = 2016'              
            ) 
               where CardNo=a.CardNo) 
				,0) as PD_LastMonth, 
        isnull((select sum(tmp.FinalValue) from atn_attendance as tmp 
                where tmp.finyear=2016 and month(tmp.attendate) = 6 and day(tmp.attendate) <= 21  
                and tmp.cardno=a.cardno),0) AS PR_CurrMonth,  
        (case 
        when a.C_DateOfReleaving <= convert(datetime,'21/06/2016',103) then 0  
        when a.C_DateOfJoining <= convert(datetime,'21/06/2016',103) then 9 
        else 30-day(a.C_DateOfJoining)+1 end) PR_CurrMonth_Add 
FROM    hrm_employees as a  
where (C_DateOfReleaving > convert(datetime,'31/05/2016',103) OR C_DateofReleaving is NULL) 
       and (a.cardno < '9000' or a.cardno in ('9883','9744','9010'))
GO
