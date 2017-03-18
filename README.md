# check_key

### 1.Tạo cron job 5p chạy 1 lần
- Terminal => crontab -e
- Chọn 1 (hoặc 2, 3) để chọn chế độ chỉnh sửa.
- Thêm cron job mới bằng cách thêm dòng sau vào cuối giao diện chỉnh sửa:
	*/5 * * * * CMD_statement (ví dụ: ruby /home/check.rb) 

### 2. Cài mysql2 module cho ruby để connect db:
- sudo apt-get install ruby-mysql2
