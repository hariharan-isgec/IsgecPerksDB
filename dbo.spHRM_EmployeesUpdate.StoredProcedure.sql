USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHRM_EmployeesUpdate]
  @AliasName NVarChar(50),
  @C_RatingID NVarChar(3),
  @C_DateOfReleaving DateTime,
  @J_DivisionID NVarChar(6),
  @IncrementCompany NVarChar(6),
  @EducationDetails NVarChar(250),
  @CareerStartedOn DateTime,
  @QualificationID1 Int,
  @QualificationID2 Int,
  @DateOfBirth DateTime,
  @BloodGroupID NVarChar(5),
  @FatherName NVarChar(50),
  @SpouseName NVarChar(50),
  @ContactNumbers NVarChar(100),
  @PermanentAddress NVarChar(250),
  @PermanentCity NVarChar(50),
  @CurrentAddress NVarChar(250),
  @CurrentCity NVarChar(50),
  @OfficeFileNumber NVarChar(50),
  @PFNumber NVarChar(50),
  @ESINumber NVarChar(50),
  @QualificationYear1 NVarChar(4),
  @QualificationYear2 NVarChar(4),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [AliasName] = @AliasName
  ,[C_RatingID] = @C_RatingID
  ,[C_DateOfReleaving] = @C_DateOfReleaving
  ,[J_DivisionID] = @J_DivisionID
  ,[IncrementCompany] = @IncrementCompany
  ,[EducationDetails] = @EducationDetails 
  ,[CareerStartedOn] = @CareerStartedOn
  ,[QualificationID1] = @QualificationID1
  ,[QualificationID2] = @QualificationID2
  ,[DateOfBirth] = @DateOfBirth
  ,[BloodGroupID] = @BloodGroupID
  ,[FatherName] = @FatherName
  ,[SpouseName] = @SpouseName
  ,[ContactNumbers] = @ContactNumbers
  ,[PermanentAddress] = @PermanentAddress
  ,[PermanentCity] = @PermanentCity
  ,[CurrentAddress] = @CurrentAddress
  ,[CurrentCity] = @CurrentCity
  ,[OfficeFileNumber] = @OfficeFileNumber
  ,[PFNumber] = @PFNumber
  ,[ESINumber] = @ESINumber
  ,[QualificationYear1] = @QualificationYear1
  ,[QualificationYear2] = @QualificationYear2  
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
