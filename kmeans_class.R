library(R6)
library(ggplot2)

Kmeans <- R6Class("Kmeans", list(
  centers = NULL,
  cluster = NULL,
  K = 0,
  X = NULL,
  PC = NULL,
  initialize = function(X, K){
    self$X = X
    self$K = as.integer(K)
    
    self$cluster = rep(NA, nrow(self$X))
    
    # To visualise the current cluster, principal components of data are calculated
    self$PC = prcomp(self$X)
  },
  set_centers = function(centers){
    self$centers = centers
    invisible(self) # return the class to chain with other methods
  },
  assignment_step = function(){
    # Write your assignment_step here.
    #### -- next line creates random clusters, and should be removed --
    self$cluster = sample(1:self$K, nrow(self$X), replace = TRUE)
    
    invisible(self) # return the class to chain with other methods
  },
  updating_step = function(){
    # Write your updating_step here (next line creates centroids at random)
    #### -- next line creates centroids at random from sample X, and should be removed --
    self$centers = self$X[sample(1:nrow(self$X), self$K),]
    
    invisible(self) # return the class to chain with other methods
  },
  sequential_step = function(x, alpha){
    # Write your sequential_step here
    #### -- next line updates the closest centroid to x using alpha learning rate --
    
    invisible(self) # return the class to chain with other methods
  },
  plot = function(title = ""){
    # Function to plot current state of the algorithm.
    # For visualisation purposes, only the first two PC are shown.
    dpc = as.data.frame(self$PC$x)
    dcenters = as.data.frame(predict(self$PC, self$centers))
    
    ggplot() + 
      geom_point(data=dpc, aes(x=PC1, y=PC2, col = LETTERS[self$cluster]), alpha = 0.5) +
      geom_point(data=dcenters, aes(x=PC1, y=PC2, col = c(LETTERS[1:self$K])), size = 4) +
      theme(legend.position = 'none') + labs(title = title)
  }
) )
