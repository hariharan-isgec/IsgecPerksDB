USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Employees](
	[CardNo] [nvarchar](8) NOT NULL,
	[Salute] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[AliasName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[C_DateOfJoining] [datetime] NULL,
	[C_CompanyID] [nvarchar](6) NULL,
	[C_DivisionID] [nvarchar](6) NULL,
	[C_OfficeID] [int] NULL,
	[C_DepartmentID] [nvarchar](6) NULL,
	[C_ProjectSiteID] [nvarchar](6) NULL,
	[C_DesignationID] [int] NULL,
	[C_BasicSalary] [decimal](12, 2) NULL,
	[C_StatusID] [nvarchar](2) NULL,
	[C_StatusRemark] [nvarchar](250) NULL,
	[C_JoinngStateID] [nvarchar](2) NULL,
	[C_RatingID] [nvarchar](3) NULL,
	[ActiveState] [bit] NULL,
	[ActiveStateEventName] [nvarchar](20) NULL,
	[U_UnderIncrement] [bit] NOT NULL,
	[U_NewBasicSalary] [decimal](12, 2) NULL,
	[C_IncrementOn] [datetime] NULL,
	[C_IncrementRemark] [nvarchar](250) NULL,
	[U_UnderPromotion] [bit] NOT NULL,
	[U_NewDesignationID] [int] NULL,
	[C_PromotionOn] [datetime] NULL,
	[C_PromotionRemark] [nvarchar](250) NULL,
	[U_UnderTransfer] [bit] NOT NULL,
	[U_CompanyID] [nvarchar](6) NULL,
	[U_DivisionID] [nvarchar](6) NULL,
	[U_OfficeID] [int] NULL,
	[U_DepartmentID] [nvarchar](6) NULL,
	[U_ProjectSiteID] [nvarchar](6) NULL,
	[U_ActiveState] [bit] NOT NULL,
	[C_TransferedOn] [datetime] NULL,
	[C_TransferRemark] [nvarchar](250) NULL,
	[U_UnderRating] [bit] NOT NULL,
	[U_NewRatingID] [nvarchar](3) NULL,
	[C_RatingDoneOn] [datetime] NULL,
	[C_RatingPoints] [decimal](8, 2) NULL,
	[C_RatingRemark] [nvarchar](250) NULL,
	[Resigned] [bit] NOT NULL,
	[C_ResignedOn] [datetime] NULL,
	[C_DateOfReleaving] [datetime] NULL,
	[C_ResignedRemark] [nvarchar](250) NULL,
	[Confirmed] [bit] NOT NULL,
	[C_ConfirmedOn] [datetime] NULL,
	[C_ConfirmationRemark] [nvarchar](250) NULL,
	[J_CompanyID] [nvarchar](6) NULL,
	[J_DivisionID] [nvarchar](6) NULL,
	[J_OfficeID] [int] NULL,
	[J_DepartmentID] [nvarchar](6) NULL,
	[J_ProjectSiteID] [nvarchar](6) NULL,
	[J_DesignationID] [int] NULL,
	[J_BasicSalary] [decimal](12, 2) NULL,
	[J_StatusID] [nvarchar](2) NULL,
	[J_StatusRemark] [nvarchar](250) NULL,
	[WorkingAreaID] [int] NULL,
	[FunctionalStatusID1] [int] NULL,
	[FunctionalStatusID2] [int] NULL,
	[FunctionalStatusID3] [int] NULL,
	[FunctionalStatusID4] [int] NULL,
	[EducationDetails] [nvarchar](250) NULL,
	[IncrementCompany] [nvarchar](6) NULL,
	[CareerStartedOn] [datetime] NULL,
	[QualificationID1] [int] NULL,
	[QualificationYear1] [nvarchar](4) NULL,
	[QualificationID2] [int] NULL,
	[QualificationYear2] [nvarchar](4) NULL,
	[DateOfBirth] [datetime] NULL,
	[BloodGroupID] [nvarchar](5) NULL,
	[FatherName] [nvarchar](50) NULL,
	[SpouseName] [nvarchar](50) NULL,
	[ContactNumbers] [nvarchar](100) NULL,
	[PermanentAddress] [nvarchar](250) NULL,
	[PermanentCity] [nvarchar](50) NULL,
	[CurrentAddress] [nvarchar](250) NULL,
	[CurrentCity] [nvarchar](50) NULL,
	[OfficeFileNumber] [nvarchar](50) NULL,
	[PFNumber] [nvarchar](50) NULL,
	[ESINumber] [nvarchar](50) NULL,
	[PAN] [nvarchar](20) NULL,
	[EMailID] [nvarchar](50) NULL,
	[Freezed] [bit] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedEvent] [nvarchar](20) NULL,
	[VerificationRequired] [bit] NOT NULL,
	[VerifierID] [nvarchar](8) NULL,
	[ApprovalRequired] [bit] NOT NULL,
	[ApproverID] [nvarchar](8) NULL,
	[ResponsibleAgencyID] [int] NULL,
	[Contractual] [bit] NOT NULL,
	[VPNMailExpireOn] [datetime] NULL,
	[Blackberry] [bit] NULL,
	[CategoryID] [int] NULL,
	[NonTechnical] [bit] NULL,
	[TAVerifier] [nvarchar](8) NULL,
	[TAApprover] [nvarchar](8) NULL,
	[TASanctioningAuthority] [nvarchar](8) NULL,
	[TASelfApproval] [bit] NOT NULL,
	[SiteAllowanceApprover] [nvarchar](8) NULL,
	[Logistic_Company] [nvarchar](10) NULL,
	[Finance_Company] [nvarchar](10) NULL,
 CONSTRAINT [PK_HRM_Employees] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_C_ProjectSiteID] FOREIGN KEY([C_ProjectSiteID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_C_ProjectSiteID]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_ApproverID] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_ApproverID]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_CategoryID]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_BloodGroups] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[HRM_BloodGroups] ([BloodGroupID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_BloodGroups]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Companies] FOREIGN KEY([C_CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Companies]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Companies1] FOREIGN KEY([IncrementCompany])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Companies1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Companies2] FOREIGN KEY([J_CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Companies2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Companies3] FOREIGN KEY([U_CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Companies3]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Departments] FOREIGN KEY([C_DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Departments]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Departments1] FOREIGN KEY([J_DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Departments1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Departments2] FOREIGN KEY([U_DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Departments2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Designations] FOREIGN KEY([C_DesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Designations]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Designations1] FOREIGN KEY([J_DesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Designations1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Designations2] FOREIGN KEY([U_NewDesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Designations2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Divisions] FOREIGN KEY([C_DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Divisions]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Divisions1] FOREIGN KEY([J_DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Divisions1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Divisions2] FOREIGN KEY([U_DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Divisions2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus1] FOREIGN KEY([FunctionalStatusID1])
REFERENCES [dbo].[HRM_FunctionalStatus1] ([FunctionalStatusID1])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus2] FOREIGN KEY([FunctionalStatusID2])
REFERENCES [dbo].[HRM_FunctionalStatus2] ([FunctionalStatusID2])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus3] FOREIGN KEY([FunctionalStatusID3])
REFERENCES [dbo].[HRM_FunctionalStatus3] ([FunctionalStatusID3])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus3]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus4] FOREIGN KEY([FunctionalStatusID4])
REFERENCES [dbo].[HRM_FunctionalStatus4] ([FunctionalStatusID4])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_FunctionalStatus4]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_JoiningStates] FOREIGN KEY([C_JoinngStateID])
REFERENCES [dbo].[HRM_JoiningStates] ([JoiningStateID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_JoiningStates]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Offices] FOREIGN KEY([C_OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Offices]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Offices1] FOREIGN KEY([J_OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Offices1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Offices2] FOREIGN KEY([U_OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Offices2]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Qualifications] FOREIGN KEY([QualificationID1])
REFERENCES [dbo].[HRM_Qualifications] ([QualificationID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Qualifications]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Qualifications1] FOREIGN KEY([QualificationID2])
REFERENCES [dbo].[HRM_Qualifications] ([QualificationID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Qualifications1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Ratings] FOREIGN KEY([C_RatingID])
REFERENCES [dbo].[HRM_Ratings] ([RatingID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Ratings]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Ratings1] FOREIGN KEY([U_NewRatingID])
REFERENCES [dbo].[HRM_Ratings] ([RatingID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Ratings1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Status] FOREIGN KEY([C_StatusID])
REFERENCES [dbo].[HRM_Status] ([StatusID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Status]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_Status1] FOREIGN KEY([J_StatusID])
REFERENCES [dbo].[HRM_Status] ([StatusID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_Status1]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_HRM_WorkingAreas] FOREIGN KEY([WorkingAreaID])
REFERENCES [dbo].[HRM_WorkingAreas] ([WorkingAreaID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_HRM_WorkingAreas]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_IDM_ResponsibleAgency] FOREIGN KEY([ResponsibleAgencyID])
REFERENCES [dbo].[IDM_ResponsibleAgency] ([ResponsibleAgencyID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_IDM_ResponsibleAgency]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_SiteAllowanceApprover] FOREIGN KEY([SiteAllowanceApprover])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_SiteAllowanceApprover]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_TAApprover] FOREIGN KEY([TAApprover])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_TAApprover]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_TASanctioningAuthority] FOREIGN KEY([TASanctioningAuthority])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_TASanctioningAuthority]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_TAVerifier] FOREIGN KEY([TAVerifier])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_TAVerifier]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Employees_VerifierID] FOREIGN KEY([VerifierID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_Employees_VerifierID]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_J_ProjectSiteID] FOREIGN KEY([J_ProjectSiteID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_J_ProjectSiteID]
GO
ALTER TABLE [dbo].[HRM_Employees]  WITH CHECK ADD  CONSTRAINT [FK_HRM_U_ProjectSiteID] FOREIGN KEY([U_ProjectSiteID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[HRM_Employees] CHECK CONSTRAINT [FK_HRM_U_ProjectSiteID]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Salute]  DEFAULT ('') FOR [Salute]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_EmployeeName]  DEFAULT ('') FOR [EmployeeName]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_AliasName]  DEFAULT ('') FOR [AliasName]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Gender]  DEFAULT ('M') FOR [Gender]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_Table_1_FathersName]  DEFAULT ('') FOR [C_DateOfJoining]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_BasicSalary]  DEFAULT ((0)) FOR [C_BasicSalary]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_C_ActiveState]  DEFAULT ((1)) FOR [ActiveState]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_U_UnderIncrement]  DEFAULT ((0)) FOR [U_UnderIncrement]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_U_UnderPromotion]  DEFAULT ((0)) FOR [U_UnderPromotion]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_U_UnderTransfer]  DEFAULT ((0)) FOR [U_UnderTransfer]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_U_ActiveState]  DEFAULT ((0)) FOR [U_ActiveState]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_U_UnderRating]  DEFAULT ((0)) FOR [U_UnderRating]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Resigned]  DEFAULT ((0)) FOR [Resigned]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Confirmed]  DEFAULT ((0)) FOR [Confirmed]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Freezed]  DEFAULT ((0)) FOR [Freezed]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_VerificationRequired_1]  DEFAULT ((0)) FOR [VerificationRequired]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_ApprovalRequired_1]  DEFAULT ((0)) FOR [ApprovalRequired]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Contractual]  DEFAULT ((0)) FOR [Contractual]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_Blackberry]  DEFAULT ((0)) FOR [Blackberry]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_NonTechnical]  DEFAULT ((0)) FOR [NonTechnical]
GO
ALTER TABLE [dbo].[HRM_Employees] ADD  CONSTRAINT [DF_HRM_Employees_TASelfApproval]  DEFAULT ((0)) FOR [TASelfApproval]
GO
