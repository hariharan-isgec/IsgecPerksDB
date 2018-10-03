USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CHKv_EventResponses]
AS
SELECT     dbo.ADM_ITEventStatus.EventID, dbo.ADM_ITEventTransactions.EntryDate AS EventDate, 
                      dbo.ADM_ITEventTransactions.Description AS EventDescription, dbo.aspnet_Users.UserFullName AS ForUser, 
                      dbo.ADM_ITServices.Description AS ServiceName, dbo.ADM_ITEventStatus.ActionNotRequired, dbo.ADM_ITEventStatus.ActionTaken, 
                      dbo.ADM_ITEventStatus.Responded, aspnet_Users_1.UserFullName AS RespondedBy, dbo.ADM_ITEventStatus.RespondedOn
FROM         dbo.ADM_ITEventTransactions INNER JOIN
                      dbo.ADM_ITEventStatus ON dbo.ADM_ITEventTransactions.EventID = dbo.ADM_ITEventStatus.EventID LEFT OUTER JOIN
                      dbo.aspnet_Users ON dbo.ADM_ITEventTransactions.CardNo = dbo.aspnet_Users.LoginID LEFT OUTER JOIN
                      dbo.aspnet_Users AS aspnet_Users_1 ON dbo.ADM_ITEventStatus.RespondedBy = aspnet_Users_1.LoginID LEFT OUTER JOIN
                      dbo.ADM_ITServices ON dbo.ADM_ITEventStatus.ITServiceID = dbo.ADM_ITServices.ITServiceID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[14] 2[8] 3) )"
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
         Begin Table = "ADM_ITEventTransactions"
            Begin Extent = 
               Top = 6
               Left = 644
               Bottom = 114
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ADM_ITEventStatus"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 203
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "aspnet_Users"
            Begin Extent = 
               Top = 158
               Left = 688
               Bottom = 266
               Right = 858
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "aspnet_Users_1"
            Begin Extent = 
               Top = 6
               Left = 436
               Bottom = 300
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ADM_ITServices"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 190
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_EventResponses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_EventResponses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_EventResponses'
GO
