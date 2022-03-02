```python
# source: https://segmentation-models.readthedocs.io/en/latest/tutorial.html#training-with-non-rgb-data

# define number of channels
N = x.shape[-1]

inp = Input(shape=(None, None, N))
l1 = Conv2D(3, (1, 1))(inp) # map N channels data to 3 channels -> add this layer to your model
out = base_model(l1)

model = Model(inp, out, name=base_model.name)

# continue with usual steps: compile, fit, etc..
```

