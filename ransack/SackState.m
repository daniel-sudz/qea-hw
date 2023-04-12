classdef SackState < handle
   properties
      outliers; 
      fit_segs_start = []; 
      fit_segs_end = []; 
      fit_circle_origins = []; 
      fit_circle_radii = [];
   end
   properties(Constant)
      debug_mode = 1; % whether to plot or not while iterating

      % RANSACK LINE FIT --------------------------------------------------
      line_vertical_thresh = 0.2; % inlier threhold for vertical line fit
      line_horizontal_gap_thresh = 0.2; % inlier threshold for line fit gap
      line_num_iters = 1000; % how many times to sample for line fit
      % RANSACK LINE FIT --------------------------------------------------

      % RANSACK CIRCLE FIT --------------------------------------------------
      circle_distance_thresh = 0.2; % inlier threshold for distance to circle model
      circle_min_pints = 5; % minimum point requirements for circle model
      circle_num_iters = 1000; % how many times to sample for circle fit
      % RANSACK CIRCLE FIT --------------------------------------------------

   end
   methods(Static)
       % initialize ransack from polar coords
       function obj = FromPolar(r, theta)
           obj = SackState();
           obj.outliers = [r .* cosd(theta), r .* sind(theta)];
           obj.outliers = filter_by_row(obj.outliers, @(x) (x(1)));
       end
   end
   methods
      % constructor
      function obj = SackState()
      end
      function [model_found] = sack_iter(self)
            [fit_seg_start, fit_seg_end, line_fit_inliers, line_fit_outliers] = sack(self.outliers, SackState.line_vertical_thresh, SackState.line_horizontal_gap_thresh, SackState.line_num_iters);
            [fit_circle_start, fit_circle_rad, circle_fit_inliers, circle_fit_outliers] = sack_circle(self.outliers, SackState.circle_distance_thresh, SackState.circle_min_pints, SackState.circle_num_iters);
            if(size(line_fit_inliers,1) == 0 && size(circle_fit_inliers,1) == 0)
                % no suitable model left in data
                model_found = 0;
                return;
            end
            if(size(line_fit_inliers,1) >= size(circle_fit_inliers,1))
               % line has a better fit
               self.fit_segs_start = [self.fit_segs_start; fit_seg_start(1) fit_seg_start(2)];
               self.fit_segs_end = [self.fit_segs_end; fit_seg_end(1) fit_seg_end(2)];
               self.outliers = line_fit_outliers;
               
               % visualize output fit to plot if in debug mode
               if(self.debug_mode)
                   scatter(line_fit_inliers(:,1), line_fit_inliers(:,2));
                   plot([fit_seg_start(1), fit_seg_end(1)], [fit_seg_start(2), fit_seg_end(2)]);
               end
            else
               % circle has a better fit
               self.fit_circle_origins = [self.fit_circle_origins; fit_circle_start(1) fit_circle_start(2)];
               self.fit_circle_radii = [self.fit_circle_radii; fit_circle_rad];
               self.outliers = circle_fit_outliers;

               % visualize output fit to plot if in debug mode
               if(self.debug_mode)
                   scatter(circle_fit_outliers(:,1), circle_fit_outliers(:,2));
                   plot_circle(fit_circle_start(1), fit_circle_start(2), fit_circle_rad);
               end
            end
            % some model was found
            model_found = 1;
      end
      % run iterative RANSACK with multiple models
      function [] = sack_multi(self)
          % visualize output fit to plot if in debug mode
          if(self.debug_mode)
              figure(); hold on; axis equal;
          end
          % resolve iteratively
          while(sack_iter(self))
          end
      end
   end
end