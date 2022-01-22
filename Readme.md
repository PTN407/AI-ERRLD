# Table of contents
1. [Useful links](#1)
    1. [Image preprocessing](#1.1)
    2. [Data](#1.2)
2. [Tại sao trong CNN, số filter lại tăng dần qua từng Convolution layer?](#2)

----------------------------------------------------------------------------------

### Useful links <a name="1"></a>
#### 1.   Image preprocessing <a name="1.1"></a>
+  https://www.freecodecamp.org/news/getting-started-with-tesseract-part-ii-f7f9a0899b3f/  
#### 2.   Data <a name="1.2"></a>
+  https://storage.googleapis.com/openimages/web/index.html (Bonus: How to get this data on colab: https://colab.research.google.com/github/voxel51/fiftyone/blob/v0.14.3/docs/source/tutorials/open_images.ipynb#scrollTo=SCLf0GqBDsAJ)
+  https://www.image-net.org/
&nbsp;  
----------------------------------------------------------------------------------
### Tại sao trong CNN, số filter lại tăng dần qua từng Convolution layer? <a name="2"></a>

Kiến thức cần tìm hiểu trước (hoặc sau) khi đọc: phép tính convolution.
  
Để trả lời câu hỏi này, chúng ta cần hiểu filter có tác dụng gì trong CNN.

Mỗi lớp filter có tác dụng lọc những thông tin có ích từ dữ liệu. Ví dụ, lớp đầu tiên lọc những thông tin lớn như cạnh, góc, điểm, .... Những lớp tiếp theo lọc những thông tin đa dạng và trừu tượng hơn (ví dụ: Sự kết hợp của các cạnh và góc tạo thành hình khối), những thông tin này phức tạp hơn, nên cần số filter nhiều hơn để lọc.
  
  
Chú ý: Chỉ có số filter là tăng, kích thước filter sẽ không đổi (thường thấy là 3x3)
  
Nguồn: https://datascience.stackexchange.com/questions/55545/in-cnn-why-do-we-increase-the-number-of-filters-in-deeper-convolution-layers-fo  
&nbsp;  
----------------------------------------------------------------------------------
