USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TA_Approvers]
AS
SELECT        dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Designations.Description AS Designation, dbo.HRM_Departments.Description AS Department, 
                         dbo.HRM_Divisions.Description AS Division, HRM_Employees_1.EmployeeName AS TAVerifier, HRM_Employees_1.CardNo AS VerifierID, HRM_Employees_2.EmployeeName AS TAApprover, 
                         HRM_Employees_2.CardNo AS ApproverID, HRM_Employees_3.EmployeeName AS SanctioningAuthority, HRM_Employees_3.CardNo AS SanctioningAuthorityID, dbo.HRM_Employees.ActiveState
FROM            dbo.HRM_Divisions RIGHT OUTER JOIN
                         dbo.HRM_Employees LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_3 ON dbo.HRM_Employees.TASanctioningAuthority = HRM_Employees_3.CardNo LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_2 ON dbo.HRM_Employees.TAApprover = HRM_Employees_2.CardNo LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_1 ON dbo.HRM_Employees.TAVerifier = HRM_Employees_1.CardNo LEFT OUTER JOIN
                         dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                         dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID ON dbo.HRM_Divisions.DivisionID = dbo.HRM_Employees.C_DivisionID
WHERE        (dbo.HRM_Employees.ActiveState = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
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
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
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
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 293
               Bottom = 136
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 6
               Left = 501
               Bottom = 136
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 6
               Left = 719
               Bottom = 136
               Right = 889
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees_2"
            Begin Extent = 
               Top = 138
               Left = 293
               Bottom = 268
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees_3"
            Begin Extent = 
               Top = 138
               Left = 548
               Bottom = 268
               Right = 76' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TA_Approvers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'5
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TA_Approvers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TA_Approvers'
GO
