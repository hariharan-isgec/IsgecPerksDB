USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_WebPayNewEmp]
AS
select
	CardNo,
	Salute,
	Gender, 
	EmployeeName,
	FatherName,
	CostCompany,
	Unit,
	Category,
  DesignationCode, 
	Designation,
	DOB,
	DOJ,
	DOL,
	EMail,
	PFNO,
	PAN,
	Department,
	Finalized,
	PensionNo, 
  SeatingLocation  
  FROM OPENQUERY(WEBPAY,
	'select pk_emp_code as CardNo,
		Salutaion as Salute,
		Sex as Gender,
		First_Name + isnull(middle_name,'''') + isnull(last_name,'''') as EmployeeName,
		Father_Name as FatherName,
		fk_costcenter_code as CostCompany,
		fk_level_code as Unit,
		fk_grade_code as Category,
		fk_desig_code as DesignationCode,
    dsg.desig_desc as Designation, 
		DOB,
		DOJ,
		DOL,
		EMail,
		pf_no as PFNo,
		pan_no as PAN,
		fk_domiclieCode as Department,
		Finalized,
		Pension_No as PensionNo, 
    fv.Field_Value as SeatingLocation  
		FROM MstEmployee 
		Left Outer Join MstEmpFieldvalue as efv on (pk_emp_code = efv.fk_emp_code and 61 = efv.fk_field_id) 
    Left Outer Join MstFieldValue as fv on (efv.fk_fieldvalue_id = fv.pk_FieldValue_id and efv.fk_field_id = fv.fk_field_id)  
		Left Outer Join MstDesig as dsg on fk_desig_code = dsg.pk_desig 
    WHERE Finalized = ''N''
	'
  ) 
  --WHERE CardNo not in (select cardno from HRM_Employees)
GO
