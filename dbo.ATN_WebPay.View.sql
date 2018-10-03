USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_WebPay]
AS
SELECT  a.CardNo, 
        a.EmployeeName, 
        a.C_DateofJoining as JDT, 
        a.C_DateOfReleaving As RDT,
        a.ActiveState,  
        (case C_OfficeID when 6 then 'Site' else 'Office' end) as Location, 
        isnull((select sum(tmp.FinalValue) from atn_attendance as tmp where tmp.finyear=2016 
         and month(tmp.attendate)=3 and tmp.cardno=a.cardno),0) AS PR_March,
				ISNULL((Select DD_March   
				 From	openquery(webpay,
						'SELECT SUM(NoofDays) AS DD_March,
                   FK_Emp_Code as CardNo 
            FROM dbo.TrnEmpCurrArrOtherDetails 
            WHERE mm = 4 AND yyyy = 2016 AND ProcessFlag NOT IN (''A'', ''M'') 
            Group By FK_Emp_Code')
					 where CardNo = a.CardNo 
				),0) as DD_March, 
        isnull((select PD_April FROM OPENQUERY(WEBPAY,
						'SELECT    fk_Emp_Code As CardNo, PaidDays As PD_April
						FROM      SalaryOtherDetails 
						WHERE     mm = 4 AND YYYY = 2016'              
            ) 
               where CardNo=a.CardNo) 
				,0) as PD_April, 
        (select sum(tmp.FinalValue) from atn_attendance as tmp where tmp.finyear=2016 
         and month(tmp.attendate)=4 and tmp.cardno=a.cardno) AS PR_April,
        (select sum(tmp.FinalValue) from atn_attendance as tmp where tmp.finyear=2016 
         and month(tmp.attendate)=5 and day(tmp.attendate) <= 21 and tmp.cardno=a.cardno) AS PR_MayUpto21, 
        (case 
        when a.C_DateOfJoining <= convert(datetime,'21/05/2016',103) then 10 
        else 31-day(a.C_DateOfJoining)+1 end) PR_MayFrom22to31 
FROM    hrm_employees as a  
where (C_DateOfReleaving > convert(datetime,'30/04/2016',103) OR C_DateofReleaving is NULL)
GO
