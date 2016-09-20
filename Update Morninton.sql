select * from ErrorLogMornington
insert into wastevoucheruse([Waste Voucher],[Date Scanned],[Time Scanned],Site)
select [waste voucher], [date scanned],convert(varchar(30),[Time Scanned],108),[site] from wastevoucherusemornington