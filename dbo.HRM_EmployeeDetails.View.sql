USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HRM_EmployeeDetails]
AS
SELECT        HRM_Employees_3.CardNo, HRM_Employees_3.EmployeeName, REPLACE(REPLACE(dbo.HRM_Designations.Description, CHAR(10), ''), CHAR(13), '') AS Desig, 
                         REPLACE(REPLACE(dbo.HRM_Departments.Description, CHAR(10), ''), CHAR(13), '') AS Depart, dbo.HRM_Divisions.Description AS Division, dbo.HRM_Offices.Description AS Location, 
                         HRM_Employees_3.EMailID, HRM_Employees_1.EmployeeName AS Verifier, HRM_Employees_2.EmployeeName AS Approver, HRM_Employees_3.ActiveState, HRM_Employees_3.TAVerifier, 
                         HRM_Employees_4.EmployeeName AS TAVerifierName, HRM_Employees_3.TAApprover, dbo.HRM_Employees.EmployeeName AS TAApproverName
FROM            dbo.HRM_Designations RIGHT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_1 RIGHT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_4 RIGHT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_3 LEFT OUTER JOIN
                         dbo.HRM_Employees ON HRM_Employees_3.TAApprover = dbo.HRM_Employees.CardNo ON HRM_Employees_4.CardNo = HRM_Employees_3.TAVerifier LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_2 ON HRM_Employees_3.ApproverID = HRM_Employees_2.CardNo ON HRM_Employees_1.CardNo = HRM_Employees_3.VerifierID ON 
                         dbo.HRM_Designations.DesignationID = HRM_Employees_3.C_DesignationID LEFT OUTER JOIN
                         dbo.HRM_Offices ON HRM_Employees_3.C_OfficeID = dbo.HRM_Offices.OfficeID LEFT OUTER JOIN
                         dbo.HRM_Departments ON HRM_Employees_3.C_DepartmentID = dbo.HRM_Departments.DepartmentID LEFT OUTER JOIN
                         dbo.HRM_Divisions ON HRM_Employees_3.C_DivisionID = dbo.HRM_Divisions.DivisionID
WHERE        (HRM_Employees_3.ActiveState = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[11] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[37] 4[12] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[51] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 725
               Bottom = 114
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 114
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_4"
            Begin Extent = 
               Top = 260
               Left = 367
               Bottom = 390
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 248
               Left = 732
               Bottom = 378
               Right = 945
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_2"
            Begin Extent = 
               Top = 5
               Left = 497
               Bottom = 113
               Right = 688
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 129
               Left = 462
               Bottom = 237
               Right = 613
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HRM_EmployeeDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'           End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 142
               Left = 46
               Bottom = 220
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 135
               Left = 290
               Bottom = 213
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HRM_EmployeeDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HRM_EmployeeDetails'
GO
