USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPersonalProfileUpdate]
  @FatherName NVarChar(50),
  @SpouseName NVarChar(50),
  @PermanentAddress NVarChar(250),
  @PermanentCity NVarChar(50),
  @CurrentAddress NVarChar(250),
  @CurrentCity NVarChar(50),
  @DateOfBirth DateTime,
  @BloodGroupID NVarChar(5),
  @ContactNumbers NVarChar(100),
  @OfficeFileNumber NVarChar(50),
  @PFNumber NVarChar(50),
  @ESINumber NVarChar(50),
  @PAN NVarChar(20),
  @EMailID NVarChar(50),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [FatherName] = @FatherName
  ,[SpouseName] = @SpouseName
  ,[PermanentAddress] = @PermanentAddress
  ,[PermanentCity] = @PermanentCity
  ,[CurrentAddress] = @CurrentAddress
  ,[CurrentCity] = @CurrentCity
  ,[DateOfBirth] = @DateOfBirth
  ,[BloodGroupID] = @BloodGroupID
  ,[ContactNumbers] = @ContactNumbers
  ,[OfficeFileNumber] = @OfficeFileNumber
  ,[PFNumber] = @PFNumber
  ,[ESINumber] = @ESINumber
  ,[PAN] = @PAN
  ,[EMailID] = @EMailID
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
