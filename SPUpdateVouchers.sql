USE [voucher]
GO
/****** Object:  StoredProcedure [dbo].[update_vouchers]    Script Date: 19/09/2016 9:11:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  procedure [dbo].[update_vouchers]
as
--Step 1 Delete voucher use records with null voucher number. Caused by lack of error checking in access fron end.

delete from WasteVoucherUse where [Waste Voucher] is null
delete from  [172.16.1.167].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null
delete from  [192.168.62.1].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null
 --delete from  [192.168.60.1].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null

--Step 2 Update local database voucher table with values from Mornington where they are higher
update lv set lv.uses = rv.uses from wastevouchers lv join [172.16.1.167].voucher.dbo.WasteVouchers rv on rv.[waste voucher] = lv.[waste voucher] 
where rv.uses > lv.uses

--Step 3 Update local voucher use table with site data Mornington
insert into WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from [172.16.1.167].voucher.dbo.WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] and t2.[Date Scanned] = [Date Scanned]
and t2.[Site] = [Site] )


--Step 4 Update local database voucher table with values from Tyabb where they are higher
update lv set lv.uses = rv.uses from wastevouchers lv join [192.168.62.1].voucher.dbo.WasteVouchers rv on rv.[waste voucher] = lv.[waste voucher] 
where rv.uses > lv.uses


--Step 5 Update local voucher use table with site data Tyabb
insert into WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from [192.168.62.1].voucher.dbo.WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] 
and t2.[Date Scanned] = [Date Scanned]and t2.[Time Scanned] = [Time Scanned]
and t2.[Site] = [Site] )

--Step 6 Update local database voucher table with values from Rye where they are higher
--update lv set lv.uses = rv.uses from wastevouchers lv join [192.168.60.1].voucher.dbo.WasteVouchers rv on rv.[waste voucher] = lv.[waste voucher] 
--where rv.uses > lv.uses

--Step 7 Update local voucher use table with site data Rye
--insert into WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
--select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from [192.168.60.1].voucher.dbo.WasteVoucherUse t2
--Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] 
--and t2.[Date Scanned] = [Date Scanned]and t2.[Time Scanned] = [Time Scanned]
--and t2.[Site] = [Site] )

--Step8 Once we have the highest use values for each voucher go back and update each site with the highest values. Mornington
update rv set rv.uses = lv.uses from [172.16.1.167].voucher.dbo.WasteVouchers rv join WasteVouchers lv on lv.[waste voucher] = rv.[waste voucher] 
where lv.uses > rv.uses

--Step 9 Update  Mornington Voucher Use Table With Master Data
insert into [172.16.1.167].voucher.dbo.WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] 
and t2.[Date Scanned] = [Date Scanned] and t2.[Time Scanned] = [Time Scanned]
and t2.[Site] = [Site] )

--Step 10 Once we have the highest use values for each voucher go back and update each site with the highest values. Tyabb
update rv set rv.uses = lv.uses from [192.168.62.1].voucher.dbo.WasteVouchers rv join WasteVouchers lv on lv.[waste voucher] = rv.[waste voucher] 
where lv.uses > rv.uses

--Step 11 Update  Tyabb Voucher Use Table With Master Data
insert into [192.168.62.1].voucher.dbo.WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] 
and t2.[Date Scanned] = [Date Scanned]and t2.[Time Scanned] = [Time Scanned]
and t2.[Site] = [Site] )

--Step 12 Once we have the highest use values for each voucher go back and update each site with the highest values. Rye
--update rv set rv.uses = lv.uses from [192.168.60.1].voucher.dbo.WasteVouchers rv join WasteVouchers lv on lv.[waste voucher] = rv.[waste voucher] 
--where lv.uses > rv.uses

--Step 13 Update  Rye Voucher Use Table With Master Data
--insert into [192.168.60.1].voucher.dbo.WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
--select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from WasteVoucherUse t2
--Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] 
--and t2.[Date Scanned] = [Date Scanned]and t2.[Time Scanned] = [Time Scanned]
--and t2.[Site] = [Site] )

 --select * from WasteVoucherUse where [Waste Voucher] is null
 --select * from  [172.16.1.167].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null
 --select * from  [192.168.62.1].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null
 --select * from  [192.168.60.1].voucher.dbo.WasteVoucherUse where [Waste Voucher] is null


