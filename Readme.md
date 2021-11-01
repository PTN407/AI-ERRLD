# All-my-hinder-error-problem-encountered-when-learning-OpenCV
Just list here, like the title, all errors and problems

# ERRORS ENCOUNTERED

1.  ERROR : Could not install packages due to an OSError: [WinError 5] Access is denied:
- Problem : Access is denied
- Solution : add --user to command
2.  ERROR : recursion is detected during loading of "cv2" binary extensions
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
  print(sys.path) # This print all paths python 
  ```
  
  + Solution for problem 2: Uninstall the version of cv2 that you manually installed, then install it using pip
3. ERROR : The function is not implemented. Rebuild the library with Windows, GTK+ 2.x or Cocoa support. If you are on Ubuntu or Debian, install libgtk2.0-dev and pkg-config, then re-run cmake or configure script in function 'cvNamedWindow'
- Solution : If you're on Linux, head [here](https://stackoverflow.com/questions/28776053/opencv-gtk2-x-error-unspecified-error-the-function-is-not-implemented)
- My solution : I encountered the error when opencv itself update to version 4.5.4-dev (or maybe i accidently updated it ?), i uninstall it and install lower-version cv2 (3.4.15 to be specific)
