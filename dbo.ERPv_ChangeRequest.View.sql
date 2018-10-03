USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ERPv_ChangeRequest]
AS
SELECT     dbo.ERP_ChaneRequest.RequestID, dbo.ERP_RequestTypes.Description AS RequestType, dbo.ERP_ChaneRequest.ChangeSubject, 
                      REPLACE(REPLACE(REPLACE(dbo.ERP_ChaneRequest.ChangeDetails, '
', ' '), '
', ' '), ':
', ' ') AS ChangeDetail, CONVERT(nvarchar(10), 
                      dbo.ERP_ChaneRequest.RequestedOn) AS RequestedOn, dbo.HRM_Employees.EmployeeName AS RequestedBy, CONVERT(nvarchar(10), 
                      dbo.ERP_ChaneRequest.ApprovedOn) AS ApprovedOn, HRM_Employees_1.EmployeeName AS ApprovedBy, 
                      dbo.ERP_RequestStatus.Description AS RequestStatus, dbo.ERP_ChaneRequest.EvaluationByIT
FROM         dbo.HRM_Employees AS HRM_Employees_1 RIGHT OUTER JOIN
                      dbo.ERP_ChaneRequest INNER JOIN
                      dbo.HRM_Employees ON dbo.ERP_ChaneRequest.RequestedBy = dbo.HRM_Employees.CardNo INNER JOIN
                      dbo.ERP_RequestTypes ON dbo.ERP_ChaneRequest.RequestTypeID = dbo.ERP_RequestTypes.RequestTypeID INNER JOIN
                      dbo.ERP_RequestStatus ON dbo.ERP_ChaneRequest.StatusID = dbo.ERP_RequestStatus.StatusID ON 
                      HRM_Employees_1.CardNo = dbo.ERP_ChaneRequest.ApprovedBy LEFT OUTER JOIN
                      dbo.ERP_RequestPriority ON dbo.ERP_ChaneRequest.PriorityID = dbo.ERP_RequestPriority.PriorityID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[43] 2[11] 3) )"
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
         Begin Table = "HRM_Employees_1"
            Begin Extent = 
               Top = 122
               Left = 206
               Bottom = 230
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ERP_ChaneRequest"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 84
               Left = 485
               Bottom = 192
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ERP_RequestTypes"
            Begin Extent = 
               Top = 148
               Left = 32
               Bottom = 226
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ERP_RequestStatus"
            Begin Extent = 
               Top = 6
               Left = 449
               Bottom = 84
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ERP_RequestPriority"
            Begin Extent = 
               Top = 6
               Left = 638
               Bottom = 84
               Right = 789
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
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ERPv_ChangeRequest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Width = 1500
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
         Column = 4980
         Alias = 1860
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ERPv_ChangeRequest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ERPv_ChangeRequest'
GO
