function [r_est,mse_min,mse_grid,a,vel,N_filt,V_filt,V]= ...
  r_est_from_clip(v,fs, ...
                  f_lo,f_hi, ...
                  Temp, ...
                  x_grid,y_grid,in_cage, ...
                  R, ...
                  verbosity)

% calculate SSE at each grid point                
[mse_grid,a,vel,N_filt,V_filt,V]= ...
  mse_grid_from_clip_and_xy_grids(v,fs, ...
                                  f_lo,f_hi, ...
                                  Temp, ...
                                  x_grid,y_grid, ...
                                  R, ...
                                  verbosity);

% find the min-sse point within the cage bounds
%[r_est,sse_min]=argmin_grid(x_grid,y_grid,sse_grid,in_cage);
[r_est,mse_min]=argmin_grid(x_grid,y_grid,mse_grid);  
  % ignore cage bounds, b/c sometimes they don't help, they hurt

end