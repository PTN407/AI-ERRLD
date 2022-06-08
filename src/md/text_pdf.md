- Mô tả bài toán: Có những link PDF trên Drive mà người chia sẻ để chế độ chỉ xem, nhưng vì một việc nào đó chúng ta sẽ muốn tải nó về. Lúc này có hai hướng tiếp cận:  
+ Nếu chỉ cần tải file để xem hoặc in: Trên mạng có rất nhiều trang chia sẻ mã JS và cách làm, nhược điểm là những mã JS tạo ra file PDF có trang là hình ảnh, nên sẽ không sửa đổi, sao chép được.  
+ Dưới đây mô tả cách dùng Selenium để lấy chữ ra từ link, lưu ý, sẽ không có cách nào cho phép tạo ra file Word giống như vậy cả, do khi tạo file PDF thì cấu trúc chữ hay hình đã bị cố định, ở đây ta chỉ lấy chữ chứ không thể lấy được cả định dạng. (hoặc chưa)  
- Ý tưởng (Thuật toán): 
+ Cho cuộn từng trang một, để web có thể tải được từng trang.  
+ 
