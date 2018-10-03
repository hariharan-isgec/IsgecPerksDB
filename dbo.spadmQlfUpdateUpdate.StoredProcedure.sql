USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQlfUpdateUpdate]
  @Original_CardNo NVarChar(8), 
  @emailid NVarChar(100),
  @Qlf1NotInList Bit,
  @Qlf1Specified NVarChar(50),
  @Qlf2NotInList Bit,
  @Qlf2Specified NVarChar(50),
  @N_CellNo NVarChar(50),
  @N_Qlf1ID Int,
  @N_Qlf1Yr NVarChar(4),
  @N_Qlf2ID Int,
  @N_Qlf2Yr NVarChar(4),
  @N_FatherName NVarChar(50),
  @N_DateOfBirth DateTime,
  @N_BloodGroupID NVarChar(5),
  @sendmail Bit,
  @Changed Bit,
  @Updated Bit,
  @UpdatedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_QlfUpdate] SET 
   [emailid] = @emailid
  ,[Qlf1NotInList] = @Qlf1NotInList
  ,[Qlf1Specified] = @Qlf1Specified
  ,[Qlf2NotInList] = @Qlf2NotInList
  ,[Qlf2Specified] = @Qlf2Specified
  ,[N_CellNo] = @N_CellNo
  ,[N_Qlf1ID] = @N_Qlf1ID
  ,[N_Qlf1Yr] = @N_Qlf1Yr
  ,[N_Qlf2ID] = @N_Qlf2ID
  ,[N_Qlf2Yr] = @N_Qlf2Yr
  ,[N_FatherName] = @N_FatherName
  ,[N_DateOfBirth] = @N_DateOfBirth
  ,[N_BloodGroupID] = @N_BloodGroupID
  ,[Qlf1ID] = @N_Qlf1ID
  ,[Qlf1Yr] = @N_Qlf1Yr
  ,[Qlf2ID] = @N_Qlf2ID
  ,[Qlf2Yr] = @N_Qlf2Yr
  ,[FatherName] = @N_FatherName
  ,[DateOfBirth] = @N_DateOfBirth
  ,[BloodGroupID] = @N_BloodGroupID
  ,[sendmail] = @sendmail
  ,[Changed] = @Changed
  ,[Updated] = @Updated
  ,[UpdatedOn] = @UpdatedOn
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
