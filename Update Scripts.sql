update  r
set r.uses = l.uses
from [192.168.62.1].voucher.dbo.wastevouchers r
join WasteVouchersTyabb l on l.[Waste Voucher] = r.[Waste Voucher]
where l.Uses > r.uses

select * from [192.168.62.1].voucher.dbo.wastevouchers r
join WasteVouchersTyabb l on l.[Waste Voucher] = r.[Waste Voucher]
where  r.uses > l.uses

select * from WasteVouchers where uses > 0

select * from WasteVoucherUseTyabb

insert into [192.168.62.1].voucher.dbo.wastevoucheruse ([Waste Voucher],[Date Scanned],[Time Scanned],[Site])
select [Waste Voucher],[Date Scanned],[Time Scanned],[Site] from WasteVoucherUseTyabb