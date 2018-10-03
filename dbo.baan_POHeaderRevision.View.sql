USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[baan_POHeaderRevision]
as
SELECT  
OrderNo  			as OrderNo  ,					
Company             as Company   ,        
OrderType           as OrderType  ,       
SupplierCode        as SupplierCode,      
TermsofPaymentCode  as TermsofPaymentCode,
Currency            as Currency          ,
PostalAddress       as PostalAddress     ,
Contact             as Contact           ,
Country             as Country           ,
TermofDelivery      as TermofDelivery    ,
ReferenceA          as ReferenceA        ,
ReferenceB          as ReferenceB        ,
UserCode            as UserCode           ,   
HeaderText          as HeaderText        ,
FooterText          as FooterText        ,
RevisionNo          as RevisionNo        ,
convert(datetime,RevisionDate,6) as RevisionDate      ,
BranchCode          as BranchCode        ,
AuthorisedSignatory as AuthorisedSignatory   ,
ReportOption        as ReportOption      ,
CancelledPO         as CancelledPO   ,    
OrderDate
FROM 
OPENQUERY([BAAN],
'SELECT 
t$orno      as OrderNo ,          
t$comp      as Company  ,         
t$cotp      as OrderType ,        
t$suno      as SupplierCode,      
t$cpay      as TermsofPaymentCode,
t$ccur      as Currency          ,
t$ccor      as PostalAddress     ,
t$ccon      as Contact           ,
t$ccty      as Country           ,
t$cdec      as TermofDelivery    ,
t$refa      as ReferenceA        ,
t$refb      as ReferenceB        ,
t$user      as UserCode,
t$txta      as HeaderText,        
t$txtb      as FooterText ,       
t$rvno      as RevisionNo  ,      
t$rvdt      as RevisionDate ,     
t$bcod      as BranchCode    ,    
t$sign      as AuthorisedSignatory,   
t$repm      as ReportOption      ,
t$canc      as CancelledPO       ,
to_char(t$odat)      as OrderDate
FROM baandb.ttdpur970200
where extract(year from baandb.ttdpur970200.t$rvdt) >= 2010
union
SELECT 
t$orno      as OrderNo ,          
t$comp      as Company  ,         
t$cotp      as OrderType ,        
t$suno      as SupplierCode,      
t$cpay      as TermsofPaymentCode,
t$ccur      as Currency          ,
t$ccor      as PostalAddress     ,
t$ccon      as Contact           ,
t$ccty      as Country           ,
t$cdec      as TermofDelivery    ,
t$refa      as ReferenceA        ,
t$refb      as ReferenceB        ,
t$user      as UserCode,
t$txta      as HeaderText,        
t$txtb      as FooterText ,       
t$rvno      as RevisionNo  ,      
t$rvdt      as RevisionDate ,     
t$bcod      as BranchCode    ,    
t$sign      as AuthorisedSignatory,   
t$repm      as ReportOption      ,
t$canc      as CancelledPO       ,
to_char(t$odat)      as OrderDate
FROM baandb.ttdpur970300
where extract(year from baandb.ttdpur970300.t$rvdt) >= 2010
') ;
GO
