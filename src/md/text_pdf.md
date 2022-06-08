- Có những link PDF trên Drive mà người chia sẻ để chế độ chỉ xem, nhưng vì một việc nào đó chúng ta sẽ muốn tải nó về. Lúc này có hai hướng tiếp cận:  
  + Nếu chỉ cần tải file để xem hoặc in: Trên mạng có rất nhiều trang chia sẻ mã JS và cách làm, nhược điểm là những mã JS tạo ra file PDF có trang là hình ảnh, nên sẽ không sửa đổi, sao chép được.  
  + Dưới đây mô tả cách dùng Selenium để lấy chữ ra từ link, lưu ý, sẽ không có cách nào cho phép tạo ra file Word giống như vậy cả, do khi tạo file PDF thì cấu trúc chữ hay hình đã bị cố định, ở đây ta chỉ lấy chữ chứ không thể lấy được cả định dạng. (hoặc chưa)  
- Ý tưởng thuật toán: 
  + Cho cuộn từng trang một, để web có thể tải được từng trang pdf: Lướt tới trang cuối cùng, đợi load, và tiếp tục lướt...  
  + Lấy tất cả các class có tên là "ndfHFb-c4YZDc-cYSp0e-DARUcf" (mỗi class này chứa một trang PDF) và với mỗi class, lấy các tag "p" (mỗi tag p là một dòng chữ trong nội dung PDF).  
  + Lưu vào 1 file txt.  
- Code (Dùng trên Google Colab):  
  + Cài đặt Selenium và Chrome driver:
```python
!pip install selenium
!apt-get update # to update ubuntu to correctly run apt install
!dpkg --configure -a
!apt install chromium-chromedriver
!cp /usr/lib/chromium-browser/chromedriver /usr/bin
```
  +  Cài đặt Chrome:
```python
import sys
sys.path.insert(0,'/usr/lib/chromium-browser/chromedriver')
from selenium import webdriver
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')
wd = webdriver.Chrome('chromedriver',options=chrome_options)
```
  + Main:
```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys 

import time

wd.maximize_window()
wd.implicitly_wait(60) # seconds

# replace file link here
wd.get('https://drive.google.com/file/d/1HgABALUmozvr2NSuFedzJzy_XR2j2yOi/view')

# scroll
for p in range(50):
    time.sleep(1)
    text_elements_array = WebDriverWait(wd, 1000000).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, ".ndfHFb-c4YZDc-cYSp0e-DARUcf  p")))
    wd.execute_script('arguments[0].scrollIntoView(true);', text_elements_array[-1])
time.sleep(1)

# get all text
text_elements_array = WebDriverWait(wd, 1000000).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, ".ndfHFb-c4YZDc-cYSp0e-DARUcf  p")))
```
  + Lưu vào txt:  
```python
f = open("output.txt", "w")
for p in text_elements_array:
    f.write(p.text)
    f.write('\n')
f.close()
```
