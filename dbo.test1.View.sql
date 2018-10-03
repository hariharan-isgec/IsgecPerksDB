USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[test1]
AS
SELECT        dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Designations.Description AS Designation, dbo.HRM_Departments.Description AS Department, 
                         dbo.HRM_Divisions.Description AS Division, HRM_Employees_1.EmployeeName AS Verifier, HRM_Employees_1.CardNo AS VerifierID, HRM_Employees_2.EmployeeName AS Approver, 
                         HRM_Employees_2.CardNo AS ApproverID, dbo.HRM_Employees.TASanctioningAuthority AS SanctionAuthority, HRM_Employees_3.EmployeeName AS SanctionAuthorityID, 
                         dbo.HRM_Employees.ActiveState
FROM            dbo.HRM_Employees AS HRM_Employees_2 RIGHT OUTER JOIN
                         dbo.HRM_Employees ON HRM_Employees_2.CardNo = dbo.HRM_Employees.TAApprover LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_1 ON dbo.HRM_Employees.TAVerifier = HRM_Employees_1.CardNo LEFT OUTER JOIN
                         dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                         dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID LEFT OUTER JOIN
                         dbo.HRM_Divisions ON dbo.HRM_Employees.C_DivisionID = dbo.HRM_Divisions.DivisionID LEFT OUTER JOIN
                         dbo.HRM_Employees AS HRM_Employees_3 ON dbo.HRM_Employees.TASanctioningAuthority = HRM_Employees_3.CardNo
WHERE        (dbo.HRM_Employees.ActiveState = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[14] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[51] 4[39] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HRM_Employees_2"
            Begin Extent = 
               Top = 259
               Left = 505
               Bottom = 389
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 31
               Left = 243
               Bottom = 161
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 10
               Left = 623
               Bottom = 140
               Right = 840
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 1
               Left = 474
               Bottom = 131
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees_3"
            Begin Extent = 
               Top = 190
               Left = 743
               Bottom = 320
               Right = 96' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
         Table = 2745
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test1'
GO
