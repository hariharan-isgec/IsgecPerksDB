USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*A/c require accruied PL in current FinYear till date. i.e. PL should be crrectted for New Joinings
FROM         dbo.PRK_Employees LEFT OUTER JOIN
                      dbo.PRK_Categories ON dbo.PRK_Employees.CategoryID = dbo.PRK_Categories.CategoryID RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.PRK_Employees.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                      dbo.ATN_LeaveLedger ON dbo.HRM_Employees.CardNo = dbo.ATN_LeaveLedger.CardNo*/
CREATE VIEW [dbo].[ATN_PLBalanceAsOn]
AS
SELECT     TOP (100) PERCENT dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, CONVERT(nvarchar(10), 
                      dbo.HRM_Employees.C_DateOfJoining, 103) AS DOJ, CONVERT(nvarchar(10), dbo.HRM_Employees.C_ConfirmedOn, 103) AS DOC, 
                      SUM(dbo.ATN_LeaveLedger.Days) AS PLBAL, dbo.PRK_Categories.Description, dbo.HRM_Designations.Description AS Designation, 
                      dbo.HRM_Employees.C_OfficeID, dbo.HRM_Offices.Description AS Location
FROM         dbo.HRM_Offices RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.HRM_Offices.OfficeID = dbo.HRM_Employees.C_OfficeID LEFT OUTER JOIN
                      dbo.HRM_Designations ON dbo.HRM_Employees.C_DesignationID = dbo.HRM_Designations.DesignationID LEFT OUTER JOIN
                      dbo.PRK_Categories RIGHT OUTER JOIN
                      dbo.PRK_Employees ON dbo.PRK_Categories.CategoryID = dbo.PRK_Employees.CategoryID ON 
                      dbo.HRM_Employees.CardNo = dbo.PRK_Employees.CardNo LEFT OUTER JOIN
                      dbo.ATN_LeaveLedger ON dbo.HRM_Employees.CardNo = dbo.ATN_LeaveLedger.CardNo
WHERE     (dbo.HRM_Employees.ActiveState = 1) AND (dbo.ATN_LeaveLedger.LeaveTypeID = N'PL' OR
                      dbo.ATN_LeaveLedger.LeaveTypeID = N'AP' OR
                      dbo.ATN_LeaveLedger.LeaveTypeID IS NULL OR
                      dbo.ATN_LeaveLedger.LeaveTypeID = N'LT') AND (dbo.ATN_LeaveLedger.TranDate <= CONVERT(datetime, '31/03/2018', 103)) AND 
                      (dbo.ATN_LeaveLedger.FinYear = 2018)
GROUP BY dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Employees.C_DateOfJoining, dbo.HRM_Employees.C_ConfirmedOn, 
                      dbo.PRK_Categories.Description, dbo.HRM_Designations.Description, dbo.HRM_Employees.C_OfficeID, dbo.HRM_Offices.Description
ORDER BY dbo.HRM_Employees.CardNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[9] 2[23] 3) )"
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
         Begin Table = "HRM_Designations"
            Begin Extent = 
               Top = 6
               Left = 893
               Bottom = 114
               Right = 1060
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "PRK_Categories"
            Begin Extent = 
               Top = 6
               Left = 688
               Bottom = 114
               Right = 855
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PRK_Employees"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 114
               Right = 650
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
            TopColumn = 2
         End
         Begin Table = "HRM_Offices"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 205
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
         Width = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PLBalanceAsOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1500
         Width = 1500
         Width = 1710
         Width = 1350
         Width = 1185
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PLBalanceAsOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_PLBalanceAsOn'
GO
