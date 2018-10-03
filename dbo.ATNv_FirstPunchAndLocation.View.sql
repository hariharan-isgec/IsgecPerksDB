USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*     AND (WRONG = CASE WHEN c_officeid = 1 AND SUBSTRING(LOWER(FirstPunchMachine),1,6) <> LOWER('Sec-24') THEN 0 ELSE 1 END)
     AND (WRONG = CASE WHEN c_officeid = 2 AND SUBSTRING(LOWER(FirstPunchMachine),1,4) <> LOWER('A-56') THEN 0 ELSE 1 END)
     AND (WRONG = CASE WHEN c_officeid = 10 AND SUBSTRING(LOWER(FirstPunchMachine),1,7) <> LOWER('Sec-63-') THEN 0 ELSE 1 END)
     AND (WRONG = CASE WHEN c_officeid = 11 AND SUBSTRING(LOWER(FirstPunchMachine),1,9) <> LOWER('Sec-63-A5') THEN 0 ELSE 1 END)
     AND WRONG = 1   */
CREATE VIEW [dbo].[ATNv_FirstPunchAndLocation]
AS
SELECT     dbo.ATN_Attendance.CardNo, dbo.HRM_Employees.EmployeeName, dbo.ATN_Attendance.AttenDate, dbo.HRM_Offices.Description AS [Office Location],
                       (CASE WHEN (SUBSTRING(LOWER(FirstPunchMachine), 1, 6) = LOWER('Sec-24')) THEN 1 WHEN (SUBSTRING(LOWER(FirstPunchMachine), 1, 4) 
                      = LOWER('A-56')) THEN 2 WHEN (SUBSTRING(LOWER(FirstPunchMachine), 1, 7) = LOWER('Sec-63-')) 
                      THEN 10 WHEN (SUBSTRING(LOWER(FirstPunchMachine), 1, 9) = LOWER('Sec-63-A5')) THEN 11 ELSE 0 END) AS PunchLocation, 
                      dbo.ATN_Attendance.FirstPunchMachine, dbo.HRM_Employees.C_OfficeID
FROM         dbo.HRM_Offices RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.HRM_Offices.OfficeID = dbo.HRM_Employees.C_OfficeID RIGHT OUTER JOIN
                      dbo.ATN_Attendance ON dbo.HRM_Employees.CardNo = dbo.ATN_Attendance.CardNo
WHERE     (dbo.ATN_Attendance.FirstPunchMachine IS NOT NULL) AND (dbo.HRM_Employees.C_OfficeID NOT IN (3, 4, 5, 6, 7, 8, 9))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[33] 2[12] 3) )"
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
               Top = 6
               Left = 509
               Bottom = 114
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 114
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 33
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
         Width = 3750
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_FirstPunchAndLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_FirstPunchAndLocation'
GO
