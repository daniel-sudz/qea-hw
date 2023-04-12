classdef SackState < handle
   properties
      outliers; 
      fit_segs_start = []; 
      fit_segs_end = []; 
      fit_circle_origins = []; 
      fit_circle_radii = [];
      debug_mode = 1; % whether to plot or not while iterating
   end
   methods
      % constructor
      function obj = SackState()
      end
      function [] = sack_iter(self)
            [fit_seg_start, fit_seg_end, line_fit_inliers, line_fit_outliers] = sack(self.outliers, d, g, n);
            [fit_circle_start, fit_circle_rad, circle_fit_inliers, circle_fit_outliers] = sack_circle(self.outliers, 0.2, 5, 10000);
            if(size(line_fit_inliers,1) >= size(circle_fit_inliers,1))
               % line has a better fit
               self.fit_segs_start = [self.fit_segs_start; fit_seg_start(1) fit_seg_start(2)];
               self.fit_segs_end = [self.fit_segs_end; fit_seg_end(1) fit_seg_end(2)];
               self.outliers = line_fit_outliers;
               
               % visualize output fit to plot if in debug mode
               if(self.debug_mode)
                   plot([fit_seg_start(1), fit_sef_end(1)], [fit_seg_start(2), fit_sef_end(2)]);
                   plot_circle(fit_circle_start(1), fit_circle_start(2), fit_circle_rad);
               end
            else
               % circle has a better fit
               self.fit_circle_origins = [self.fit_circle_origins; fit_circle_start(1) fit_circle_start(2)];
               self.fit_circle_radii = [self.fit_circle_radii; fit_circle_rad];
               self.outliers = circle_fit_outliers;

               % visualize output fit to plot if in debug mode
               if(self.debug_mode)
                   plot_circle(fit_circle_start(1), fit_circle_start(2), fit_circle_rad);
               end
            end
      end
   end
end