USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QCMv_Attendance]
AS
SELECT     TOP (100) PERCENT dbo.HRM_Employees.EmployeeName, dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.PunchStatusID, 
                      dbo.ATN_Attendance.Applied, dbo.ATN_Attendance.Applied1LeaveTypeID, dbo.ATN_Attendance.Applied2LeaveTypeID, dbo.ATN_Attendance.CardNo, 
                      dbo.QCM_Requests.RequestID
FROM         dbo.HRM_Employees INNER JOIN
                      dbo.ATN_Attendance ON dbo.HRM_Employees.CardNo = dbo.ATN_Attendance.CardNo INNER JOIN
                      dbo.QCM_InspectorGroupUsers ON dbo.HRM_Employees.CardNo = dbo.QCM_InspectorGroupUsers.CardNo LEFT OUTER JOIN
                      dbo.QCM_Requests ON dbo.ATN_Attendance.CardNo = dbo.QCM_Requests.AllotedTo AND 
                      dbo.ATN_Attendance.AttenDate >= dbo.QCM_Requests.AllotedStartDate AND 
                      dbo.ATN_Attendance.AttenDate <= dbo.QCM_Requests.AllotedFinishDate
WHERE     (dbo.ATN_Attendance.FinYear = N'2013')
ORDER BY dbo.HRM_Employees.EmployeeName, dbo.ATN_Attendance.AttenDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[16] 2[12] 3) )"
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
               Left = 308
               Bottom = 114
               Right = 499
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 92
               Left = 585
               Bottom = 200
               Right = 789
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "QCM_InspectorGroupUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 84
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "QCM_Requests"
            Begin Extent = 
               Top = 84
               Left = 38
               Bottom = 192
               Right = 270
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
         Width = 2490
         Width = 2445
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
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Attendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Attendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'QCMv_Attendance'
GO
