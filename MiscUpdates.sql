select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from [192.168.62.1].voucher.dbo.WasteVoucherUse t2
Where  t2.[Waste Voucher] not in (select [Waste Voucher] from WasteVoucherUse where 
t2.[Waste Voucher]= [Waste Voucher] and t2.[Date Scanned] = [Date Scanned] and t2.[Time Scanned] = [Time Scanned]
and t2.[Site] = [Site] )
update a set a.[Time Scanned] = convert(varchar(30),b.[Time Scanned],108)
from [192.168.62.1].voucher.dbo.WasteVoucherUse a join WasteVoucherUseTyabb b on a.[Waste Voucher]= b.[Waste Voucher]

select * from WasteVoucherUse order by [Waste Voucher]
Tyabb where [Waste Voucher] = 83915

select [Waste Voucher], convert(varchar(30),[Time Scanned],108) from WasteVoucherUseTyabb

select * from [192.168.62.1].voucher.dbo.WasteVoucherUse 


