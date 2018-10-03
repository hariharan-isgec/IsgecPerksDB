USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_DelayInApplyDetail]
AS
SELECT     TOP (100) PERCENT dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.ATN_Attendance.AttenDate, 
                      dbo.ATN_ApplHeader.AppliedOn, DATEDIFF(d, dbo.ATN_Attendance.AttenDate, dbo.ATN_ApplHeader.AppliedOn) AS [Delay In days], 
                      dbo.ATN_Attendance.Applied, dbo.ATN_Attendance.Applied1LeaveTypeID, dbo.ATN_Attendance.Applied2LeaveTypeID, 
                      dbo.HRM_Departments.Description
FROM         dbo.ATN_Attendance INNER JOIN
                      dbo.ATN_ApplHeader ON dbo.ATN_Attendance.ApplHeaderID = dbo.ATN_ApplHeader.LeaveApplID INNER JOIN
                      dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo INNER JOIN
                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID
WHERE     (dbo.ATN_Attendance.Applied = 1) AND (MONTH(dbo.ATN_Attendance.AttenDate) = 6) AND (dbo.ATN_Attendance.Applied1LeaveTypeID = N'SP') AND 
                      (DATEDIFF(d, dbo.ATN_Attendance.AttenDate, dbo.ATN_ApplHeader.AppliedOn) > 0) OR
                      (dbo.ATN_Attendance.Applied = 1) AND (MONTH(dbo.ATN_Attendance.AttenDate) = 6) AND (DATEDIFF(d, dbo.ATN_Attendance.AttenDate, 
                      dbo.ATN_ApplHeader.AppliedOn) > 0) AND (dbo.ATN_Attendance.Applied2LeaveTypeID = N'SP')
ORDER BY dbo.HRM_Departments.Description, dbo.ATN_Attendance.CardNo
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
               Bottom = 114
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_ApplHeader"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 114
               Right = 437
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
            TopColumn = 10
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 84
               Right = 626
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_DelayInApplyDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_DelayInApplyDetail'
GO
