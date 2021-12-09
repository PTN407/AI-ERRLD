## ERRORS ENCOUNTERED

### 1.  ERROR : Could not install packages due to an OSError: [WinError 5] Access is denied:
- Problem : Access is denied
- Solution : add --user to command
### 2.  ERROR : recursion is detected during loading of "cv2" binary extensions
- Problem : 
  + Multible version of cv2 are found by Python so that they call each other hence the recursion problem (problem 1)
  + cv2 was manually compiled and installed (problem 2)
- Solution: 
  + Overall solution for problem 1: delete til only one version of cv2 is left
  + My solution: I encountered this problem when i installed both cv2 in pip and conda, deleted cv2 in appdata works, to see directory python used:
  
  ```python
  import cv2
  import sys
  print(cv2.__version__) # This print the version of cv2 that python is using
  print(sys.path) # This print all paths python is using
  print(cv2.__file__) # this print path to pyd file of cv2
  ```
  
  + Solution for problem 2: Uninstall the version of cv2 that you manually installed, then install it using pip
### 3. ERROR : The function is not implemented. Rebuild the library with Windows, GTK+ 2.x or Cocoa support. If you are on Ubuntu or Debian, install libgtk2.0-dev and pkg-config, then re-run cmake or configure script in function 'cvNamedWindow'
- Solution : If you're on Linux, head [here](https://stackoverflow.com/questions/28776053/opencv-gtk2-x-error-unspecified-error-the-function-is-not-implemented)
- My solution : I encountered the error when opencv itself update to version 4.5.4-dev (or maybe i accidently updated it ?), i uninstall it and install lower-version cv2 (3.4.15 to be specific) :
```bash
pip uninstall opencv-contrib-python
pip install opencv-contrib-python==3.4.15.55
```
  
## Unwanted Behaviours

### 1. cv2 resize show strange image
- Problem + Solution : Don't use 
```python
img.resize(h, w)
```
use
```python
cv2.resize(img, (h, w))
```
when you want to zoom image, use:
```python
imutils.resize(img, width=(zoomSize * img.shape[1]))
```
or:  
```python  
img = cv2.resize(img, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_AREA) # shrinking  
img = cv2.resize(img, None, fx=2, fy=2, interpolation=cv2.INTER_CUBIC) # enlarging
# source : https://www.freecodecamp.org/news/getting-started-with-tesseract-part-ii-f7f9a0899b3f/  
```  
### 2. image too big to display
```python
import cv2
cv2.namedWindow("output", cv2.WINDOW_NORMAL)    # Create window with freedom of dimensions, fit the window to the screen
im = cv2.imread("earth.jpg")                    # Read image
imS = cv2.resize(im, (960, 540))                # Resize image, IF YOU DON'T HAVE THIS LINE, the window will fit the screen, but the image isn't ( so the window will only show a part of the image)
cv2.imshow("output", imS)                       # Show image
cv2.waitKey(0)                                  # Display the image infinitely until any keypress
```
source : https://stackoverflow.com/questions/35180764/opencv-python-image-too-big-to-display
