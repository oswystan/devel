# pytorch

## installation

```bash
brew install python3
pip3 install torch torchvision torchaudio
```

## verification

```python
import torch
x = torch.rand(5, 3)
print(x)
```

# hardware backends

## apple silicon MPS

```python
  if torch.backends.mps.is_available():
    dev = torch.device("mps")
    x = torch.ones(4, device=dev)
    print (x)
  else:
    print ("MPS device not found.")
```

## navidia cuda



## cpu



## npu



## google tpu

