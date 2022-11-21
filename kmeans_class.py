import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.decomposition import PCA

class Kmeans:
  centers = None,
  cluster = None,
  K = 0,
  X = None,
  PC = None,
  def __init__(self, X, K):
    self.X = X
    self.K = K
    
    self.PC = PCA(n_components=2).fit(self.X)
    
  def set_centers(self, centers):
    self.centers = centers
    return self
    
  def assignment_step(self):
    # Write your assignment_step here.
    #### -- next line creates random clusters, and should be removed --
    self.cluster = np.random.randint(0, self.K, self.X.shape[0])
    
    return self
    
  def updating_step(self):
    # Write your updating_step here (next line creates centroids at random)
    #### -- next line creates centroids at random from sample X, and should be removed --
    self.centers = self.X[np.random.randint(0, self.X.shape[0], self.K),:]
    
    return self

  def sequential_step(self, x, alpha):
    # Write your sequential_step here
    #### -- next line updates the closest centroid to x using alpha learning rate --
    
    return self
  
  def plot(self, title = ""):
    if self.centers is None:
      print("No centroids defined")
    
    # Function to plot current state of the algorithm.
    # For visualisation purposes, only the first two PC are shown.
    PC = self.PC.transform(self.X)
    C2 = self.PC.transform(self.centers)
    
    if self.cluster[0] is None:
      plt.scatter(PC[:,0], PC[:,1], alpha=0.5)
    else:
      plt.scatter(PC[:,0], PC[:,1], c=self.cluster, alpha=0.5)
      
    plt.scatter(C2[:,0], C2[:,1], s=100, c=np.arange(self.K), edgecolors = 'black')
    plt.title(title)
    plt.show()
    plt.clf()
