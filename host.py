import qsharp
from HostPython import SayHello

print(SayHello.simulate(name="quantum world"))



# import numpy as np
# from Microsoft.Quantum.Simulation.Simulators import QuantumSimulator
# from QsharpLogisticRegression import LogisticRegression

# # Read data from CSV file
# lines = np.loadtxt("data.csv", delimiter=",", skiprows=1)
# features = lines[:, :-1]
# labels = lines[:, -1]

# # Run Q# program with data as input
# sim = QuantumSimulator()
# result = LogisticRegression.simulate(features, labels, sim=sim)

# # Print results
# print(f"Accuracy: {result.item1}")
