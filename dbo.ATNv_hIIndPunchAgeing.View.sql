USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_hIIndPunchAgeing]
AS
SELECT     dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Departments.Description AS Department, 
                      dbo.HRM_Offices.Description AS Location, MONTH(dbo.ATN_Attendance.AttenDate) AS InMonth, dbo.PRK_Categories.Description AS Designation, 
                      DATEDIFF(n, CONVERT(datetime, '01/01/2011 ' + REPLACE(RIGHT('00' + LTRIM(STR(dbo.ATN_Attendance.Punch1Time, 5, 2)), 5), '.', ':'), 103), 
                      CONVERT(datetime, '01/01/2011 ' + REPLACE(RIGHT('00' + LTRIM(STR(dbo.ATN_Attendance.Punch2Time, 5, 2)), 5), '.', ':'), 103)) - 525 AS t1
FROM         dbo.PRK_Employees LEFT OUTER JOIN
                      dbo.PRK_Categories ON dbo.PRK_Employees.CategoryID = dbo.PRK_Categories.CategoryID RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.PRK_Employees.CardNo = dbo.HRM_Employees.CardNo RIGHT OUTER JOIN
                      dbo.ATN_Attendance ON dbo.HRM_Employees.CardNo = dbo.ATN_Attendance.CardNo LEFT OUTER JOIN
                      dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID LEFT OUTER JOIN
                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID
WHERE     (dbo.HRM_Employees.ActiveState = 1) AND (dbo.ATN_Attendance.FinYear = N'2011') AND (dbo.ATN_Attendance.Punch2Time > 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[17] 3) )"
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
         Begin Table = "PRK_Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PRK_Categories"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 114
               Right = 405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 114
               Left = 267
               Bottom = 222
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 222
               Left = 227
               Bottom = 300
               Right = 378
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
      Begin ColumnWidths = 10
         Width = 284
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_hIIndPunchAgeing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2295
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3105
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_hIIndPunchAgeing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_hIIndPunchAgeing'
GO
