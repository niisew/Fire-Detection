install.packages('ddalpha')
library('ddalpha')

#SIMPLICIAL VOLUME
simplicial_volume_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  simplicial_volume_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.simplicialVolume(x1, data, exact = F)
    i <- i + 10
    simplicial_volume_List <- append(simplicial_volume_List, depths1)
  }
  return(simplicial_volume_List)
}

#CONVEX HULL PEELING
convex_hull_peeling_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  convex_hull_peeling_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.qhpeeling(x1, data)
    i <- i + 10
    convex_hull_peeling_List <- append(convex_hull_peeling_List, depths1)
  }
  return(convex_hull_peeling_List)
}

#ZONOID DEPTH
zonoid_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  zonoid_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.zonoid(x1, data, seed = 0)
    i <- i + 10
    zonoid_depth_List <- append(zonoid_depth_List, depths1)
  }
  return(zonoid_depth_List)
}

#SPATIAL DEPTH
spatial_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  spatial_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.spatial(x1, data, mah.estimate = "moment", mah.parMcd = 0.75)
    i <- i + 10
    spatial_depth_List <- append(spatial_depth_List, depths1)
  }
  return(spatial_depth_List)
}

#MAHALANOBIS DEPTH
mahalanobis_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  mahalanobis_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.Mahalanobis(x1, data, mah.estimate = "moment", mah.parMcd = 0.75)
    i <- i + 10
    mahalanobis_depth_List <- append(mahalanobis_depth_List, depths1)
  }
  return(mahalanobis_depth_List)
}

#HALFSPACE
halfspace_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  halfspace_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.halfspace(x1, data, num.directions = 15000)
    i <- i + 10
    halfspace_depth_List <- append(halfspace_depth_List, depths1)
  }
  return(halfspace_depth_List)
}

#HALFSPACE (Exact)
halfspace__exact_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  halfspace_exact_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.halfspace(x1, data, exact = T)
    i <- i + 10
    halfspace_exact_depth_List <- append(halfspace_exact_depth_List, depths1)
  }
  return(halfspace_exact_depth_List)
}

#PROJECTION DEPTH
projection_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  projection_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.projection(x1, data, method = "random", num.directions = 1000, seed = 0)
    i <- i + 10
    projection_depth_List <- append(projection_depth_List, depths1)
  }
  return(projection_depth_List)
}

#SIMPLICIAL DEPTH
simplicial_depth_list <- function(python_vector, data_points, data_dim) {
  data <- matrix(unlist(python_vector), ncol = data_dim, nrow=data_points)
  simplicial_depth_List <- list()
  i <- 1
  while(i < data_points*data_dim){
    m <-  i + 9
    x1 <- data[i:m]
    depths1 <- depth.simplicial(x1, data, exact = F, k = 0.05, seed = 0)
    i <- i + 10
    simplicial_depth_List <- append(simplicial_depth_List, depths1)
  }
  return(simplicial_depth_List)
}
