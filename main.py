import pandas as pd
import matplotlib.pyplot as plt

data = {
  'fruits': ['apple', 'banana', 'cherry'],
  'vegetables': ['carrot', 'broccoli', 'spinach'],
  'amounts': [5, 10, 15]
}

df = pd.DataFrame(data)
print(df)

