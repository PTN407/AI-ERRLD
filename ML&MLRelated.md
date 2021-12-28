### 1.   Busy server in Colab  
Problem: Your program is running, perhaps infinity loops ?  
Solution: Runtime -> Restart Runtime
### 2.   Neural Network Always Produces Same/Similar Outputs for Any Input
Link: https://stackoverflow.com/questions/4493554/neural-network-always-produces-same-similar-outputs-for-any-input
### 3.   Numpy array whose elements have different types
Solution: 
```python
np.array(data, dtype = object) # add dtype = object
```
