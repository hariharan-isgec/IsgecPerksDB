USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_FPNotRegularized]
AS
SELECT     TOP (100) PERCENT dbo.ATN_Attendance.CardNo, dbo.ATN_Attendance.AttenDate, dbo.HRM_Employees.EmployeeName, 
                      dbo.HRM_Departments.Description, dbo.HRM_Designations.Description AS Expr1, dbo.ATN_Attendance.Punch1Time, 
                      dbo.ATN_Attendance.Applied
FROM         dbo.HRM_Departments RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.HRM_Departments.DepartmentID = dbo.HRM_Employees.C_DepartmentID LEFT OUTER JOIN
                      dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID RIGHT OUTER JOIN
                      dbo.ATN_Attendance ON dbo.HRM_Employees.CardNo = dbo.ATN_Attendance.CardNo
WHERE     (dbo.ATN_Attendance.ConfigStatus = 'FP') AND (dbo.ATN_Attendance.FinalValue < 1) AND (MONTH(dbo.ATN_Attendance.AttenDate) = 10)
ORDER BY Expr1, dbo.ATN_Attendance.CardNo, dbo.ATN_Attendance.AttenDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[34] 2[9] 3) )"
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
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 114
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 28
               Left = 498
               Bottom = 136
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 84
               Right = 830
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
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_FPNotRegularized'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_FPNotRegularized'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_FPNotRegularized'
GO
