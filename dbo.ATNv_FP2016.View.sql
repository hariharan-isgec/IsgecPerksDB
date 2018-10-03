USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_FP2016]
AS
SELECT        dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Divisions.Description AS DivisionName, dbo.HRM_Departments.Description AS DepartmentName, 
                         dbo.HRM_Designations.Description AS DesignationName, dbo.HRM_Offices.Description AS Location, dbo.ATN_Attendance.Applied1LeaveTypeID, dbo.ATN_Attendance.Applied2LeaveTypeID, 
                         dbo.ATN_Attendance.AttenDate
FROM            dbo.HRM_Divisions RIGHT OUTER JOIN
                         dbo.HRM_Designations RIGHT OUTER JOIN
                         dbo.HRM_Employees ON dbo.HRM_Designations.DesignationID = dbo.HRM_Employees.C_DesignationID LEFT OUTER JOIN
                         dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID LEFT OUTER JOIN
                         dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID ON dbo.HRM_Divisions.DivisionID = dbo.HRM_Employees.C_DivisionID RIGHT OUTER JOIN
                         dbo.ATN_Attendance ON dbo.HRM_Employees.CardNo = dbo.ATN_Attendance.CardNo
WHERE        (dbo.HRM_Employees.ActiveState = 1) AND (dbo.ATN_Attendance.FinYear = N'2016') AND (dbo.ATN_Attendance.Applied1LeaveTypeID = N'FP') AND (dbo.HRM_Designations.DesignationID IN (13, 14, 15, 16, 20, 
                         21, 22, 24, 26, 27, 28, 29, 30, 32, 33, 43)) OR
                         (dbo.HRM_Employees.ActiveState = 1) AND (dbo.ATN_Attendance.FinYear = N'2016') AND (dbo.ATN_Attendance.Applied2LeaveTypeID = N'FP') AND (dbo.HRM_Designations.DesignationID IN (13, 14, 15, 16, 20, 
                         21, 22, 24, 26, 27, 28, 29, 30, 32, 33, 43))
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
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 196
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 3
               Left = 295
               Bottom = 133
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 0
               Left = 798
               Bottom = 130
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 146
               Left = 572
               Bottom = 276
               Right = 752
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 0
               Left = 541
               Bottom = 130
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 138
               Left = 345
               Bottom = 268
               Right = 515
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
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_FP2016'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_FP2016'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_FP2016'
GO
