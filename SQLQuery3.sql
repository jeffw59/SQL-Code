

insert into WasteVoucherUse  ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from [172.16.1.167].voucher.dbo.WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where t2.[Waste Voucher]= [Waste Voucher] and t2.[Date Scanned] = [Date Scanned]
 )

select * from WasteVoucherUse

truncate table WasteVoucherUse