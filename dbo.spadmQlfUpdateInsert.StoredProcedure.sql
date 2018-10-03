USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQlfUpdateInsert]
  @CardNo NVarChar(8),
  @emailid NVarChar(100),
  @DepartmentID NVarChar(6),
  @Qlf1ID Int,
  @Qlf1Yr NVarChar(4),
  @Qlf1NotInList Bit,
  @Qlf1Specified NVarChar(50),
  @Qlf2ID Int,
  @Qlf2Yr NVarChar(4),
  @Qlf2NotInList Bit,
  @Qlf2Specified NVarChar(50),
  @FatherName NVarChar(50),
  @DateOfBirth DateTime,
  @BloodGroupID NVarChar(5),
  @sendmail Bit,
  @Return_CardNo NVarChar(8) = null OUTPUT
  AS
  INSERT [HRM_QlfUpdate]
  (
   [CardNo]
  ,[emailid]
  ,[DepartmentID]
  ,[Qlf1ID]
  ,[Qlf1Yr]
  ,[Qlf1NotInList]
  ,[Qlf1Specified]
  ,[Qlf2ID]
  ,[Qlf2Yr]
  ,[Qlf2NotInList]
  ,[Qlf2Specified]
  ,[FatherName]
  ,[DateOfBirth]
  ,[BloodGroupID]
  ,[sendmail]
  )
  VALUES
  (
   @CardNo
  ,@emailid
  ,@DepartmentID
  ,@Qlf1ID
  ,@Qlf1Yr
  ,@Qlf1NotInList
  ,@Qlf1Specified
  ,@Qlf2ID
  ,@Qlf2Yr
  ,@Qlf2NotInList
  ,@Qlf2Specified
  ,@FatherName
  ,@DateOfBirth
  ,@BloodGroupID
  ,@sendmail
  )
  SET @Return_CardNo = @CardNo
GO
