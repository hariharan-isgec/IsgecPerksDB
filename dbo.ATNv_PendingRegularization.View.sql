USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_PendingRegularization]
AS
SELECT     TOP (100) PERCENT dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, case when DAY(dbo.ATN_Attendance.AttenDate) > 21 then case when MONTH(dbo.ATN_Attendance.AttenDate)=12 then 1 else MONTH(dbo.ATN_Attendance.AttenDate) + 1 end else MONTH(dbo.ATN_Attendance.AttenDate) end AS AttenMonth, 
                      SUM(1 - dbo.ATN_Attendance.FinalValue) AS SFinalValue, ISNULL(dbo.HRM_Designations.Description, '-') AS Designation_Description, 
                      ISNULL(dbo.HRM_Departments.Description, '-') AS Department_Description, ISNULL(dbo.HRM_Offices.Description, '-') AS Office_Description, 
                      dbo.ATN_Attendance.FinYear, dbo.aspnet_Users.EMailID, dbo.HRM_Employees.C_OfficeID as OfficeID 
FROM         dbo.ATN_Attendance INNER JOIN
                      dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                      dbo.aspnet_Users ON dbo.ATN_Attendance.CardNo = dbo.aspnet_Users.UserName LEFT OUTER JOIN
                      dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID LEFT OUTER JOIN
                      dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID
WHERE     (dbo.HRM_Employees.ActiveState = 1)
GROUP BY dbo.ATN_Attendance.FinYear, dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, case when DAY(dbo.ATN_Attendance.AttenDate) > 21 then case when MONTH(dbo.ATN_Attendance.AttenDate)=12 then 1 else MONTH(dbo.ATN_Attendance.AttenDate) + 1 end else MONTH(dbo.ATN_Attendance.AttenDate) end, 
                      ISNULL(dbo.HRM_Designations.Description, '-'), ISNULL(dbo.HRM_Departments.Description, '-'), ISNULL(dbo.HRM_Offices.Description, '-'), 
                      dbo.aspnet_Users.EMailID, dbo.HRM_Employees.C_OfficeID 
HAVING      (SUM(1 - dbo.ATN_Attendance.FinalValue) > 0)
ORDER BY dbo.ATN_Attendance.FinYear, AttenMonth, SFinalValue DESC, dbo.ATN_Attendance.CardNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[23] 2[18] 3) )"
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
         Configuration = "(H (4[40] 2[12] 3) )"
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
         Left = -379
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
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 114
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 114
               Right = 641
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
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 6
               Left = 868
               Bottom = 114
               Right = 1019
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users"
            Begin Extent = 
               Top = 6
               Left = 1057
               Bottom = 114
               Right = 1243
            End
            DisplayFlags = 280
            TopColumn = 8
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
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_PendingRegularization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 2880
         Width = 1500
         Width = 2835
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 2190
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_PendingRegularization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_PendingRegularization'
GO
