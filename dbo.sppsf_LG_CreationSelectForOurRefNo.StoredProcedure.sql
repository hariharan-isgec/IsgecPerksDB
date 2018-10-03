USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sppsf_LG_CreationSelectForOurRefNo]
  @SerialNo Int,
  @LoginID NVarChar(8),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
	
	DECLARE @OurRefNo Nvarchar(7) 
  
  SELECT @OurRefNo = OurRefNo FROM PSF_HSBCMain Where SerialNo = @SerialNo


  SELECT
    [PSF_HSBCMain].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
    [HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
    [PSF_Status4].[Description] AS PSF_Status4_Description,
    [PSF_Supplier5].[SupplierName] AS PSF_Supplier5_SupplierName 
  FROM [PSF_HSBCMain] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PSF_HSBCMain].[CreatedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PSF_HSBCMain].[ApprovedBy] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PSF_HSBCMain].[ModifiedBy] = [HRM_Employees3].[CardNo]
  INNER JOIN [PSF_Status] AS [PSF_Status4]
    ON [PSF_HSBCMain].[PSFStatus] = [PSF_Status4].[PSFStatus]
  INNER JOIN [PSF_Supplier] AS [PSF_Supplier5]
    ON [PSF_HSBCMain].[SupplierCode] = [PSF_Supplier5].[SupplierID]
  WHERE
        [PSF_HSBCMain].[OurRefNo] = @OurRefNo 
		  --AND [PSF_HSBCMain].[PSFStatus] = 3 

  SET @RecordCount = @@RowCount

  END
GO
