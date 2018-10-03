USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_ODDetails]
AS
SELECT        dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Divisions.Description AS Division, dbo.HRM_Designations.Description AS Designation, 
                         dbo.HRM_Departments.Description AS Department, dbo.HRM_Offices.Description AS Location, dbo.ATN_Attendance.Posted1LeaveTypeID, dbo.ATN_Attendance.Posted2LeaveTypeID, dbo.ATN_Attendance.Punch1Time, 
                         dbo.ATN_Attendance.Punch2Time, dbo.ATN_Attendance.FinYear, dbo.ATN_Attendance.Destination, dbo.ATN_Attendance.Purpose
FROM            dbo.ATN_Attendance INNER JOIN
                         dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                         dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                         dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID LEFT OUTER JOIN
                         dbo.HRM_Offices ON dbo.HRM_Employees.C_OfficeID = dbo.HRM_Offices.OfficeID LEFT OUTER JOIN
                         dbo.HRM_Divisions ON dbo.HRM_Employees.C_DivisionID = dbo.HRM_Divisions.DivisionID
WHERE        (dbo.ATN_Attendance.FinYear = N'2018') AND (dbo.ATN_Attendance.Posted1LeaveTypeID = N'OD') AND (MONTH(dbo.ATN_Attendance.AttenDate) IN (7, 5, 6)) AND (dbo.HRM_Employees.ActiveState = 1) AND 
                         (dbo.HRM_Employees.C_OfficeID <> 6) OR
                         (dbo.ATN_Attendance.FinYear = N'2018') AND (MONTH(dbo.ATN_Attendance.AttenDate) IN (7, 5, 6)) AND (dbo.HRM_Employees.ActiveState = 1) AND (dbo.HRM_Employees.C_OfficeID <> 6) AND 
                         (dbo.ATN_Attendance.Posted2LeaveTypeID = N'OD')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[24] 2[18] 3) )"
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
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 301
               Bottom = 141
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 764
               Bottom = 136
               Right = 934
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 138
               Left = 263
               Bottom = 268
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Divisions"
            Begin Extent = 
               Top = 6
               Left = 556
               Bottom = 136
               Right = 726
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
         Width ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_ODDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_ODDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_ODDetails'
GO
