USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_AnnualLeaveAnalysis]
AS
SELECT     dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Designations.Description AS Designation, 
                      dbo.HRM_Departments.Description AS Department, dbo.HRM_Offices.Description AS Location, 
                      CASE dbo.ATN_LeaveLedger.LeaveTypeID WHEN 'AS' THEN 'AA' ELSE LeaveTypeID END AS LeaveTypeID, SUM(dbo.ATN_LeaveLedger.Days * - 1) 
                      AS Expr1
FROM         dbo.HRM_Offices RIGHT OUTER JOIN
                      dbo.ATN_LeaveLedger INNER JOIN
                      dbo.ATN_Attendance ON dbo.ATN_LeaveLedger.ApplDetailID = dbo.ATN_Attendance.AttenID INNER JOIN
                      dbo.HRM_Employees ON dbo.ATN_Attendance.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                      dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                      dbo.HRM_Departments ON dbo.HRM_Employees.C_DepartmentID = dbo.HRM_Departments.DepartmentID ON 
                      dbo.HRM_Offices.OfficeID = dbo.HRM_Employees.C_OfficeID
WHERE     (dbo.ATN_LeaveLedger.FinYear = N'2012') AND (dbo.ATN_LeaveLedger.TranType = N'TRN') AND (dbo.HRM_Employees.ActiveState = 1) 
GROUP BY dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Designations.Description, dbo.HRM_Departments.Description, 
                      dbo.HRM_Offices.Description, dbo.ATN_LeaveLedger.LeaveTypeID


--AND 
--                      (MONTH(dbo.ATN_Attendance.AttenDate) <= 3)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[12] 2[11] 3) )"
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
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 121
               Left = 862
               Bottom = 229
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_LeaveLedger"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 450
               Bottom = 114
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 114
               Right = 830
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 6
               Left = 868
               Bottom = 84
               Right = 1019
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
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_AnnualLeaveAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_AnnualLeaveAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_AnnualLeaveAnalysis'
GO
