USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficialProfileUpdate]
  @WorkingAreaID Int,
  @FunctionalStatusID1 Int,
  @FunctionalStatusID2 Int,
  @FunctionalStatusID3 Int,
  @FunctionalStatusID4 Int,
  @CareerStartedOn DateTime,
  @EducationDetails NVarChar(250),
  @QualificationID1 Int,
  @QualificationYear1 NVarChar(4),
  @QualificationID2 Int,
  @QualificationYear2 NVarChar(4),
  @IncrementCompany NVarChar(6),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [WorkingAreaID] = @WorkingAreaID
  ,[FunctionalStatusID1] = @FunctionalStatusID1
  ,[FunctionalStatusID2] = @FunctionalStatusID2
  ,[FunctionalStatusID3] = @FunctionalStatusID3
  ,[FunctionalStatusID4] = @FunctionalStatusID4
  ,[CareerStartedOn] = @CareerStartedOn
  ,[EducationDetails] = @EducationDetails
  ,[QualificationID1] = @QualificationID1
  ,[QualificationYear1] = @QualificationYear1
  ,[QualificationID2] = @QualificationID2
  ,[QualificationYear2] = @QualificationYear2
  ,[IncrementCompany] = @IncrementCompany
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
