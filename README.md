# rgb2gray
Convert RGB to Gray  

Input: RGB    -- M*3 or 3*M or M*N*3
           method -- The method must be one of ['rec601', 'itu709', 'itu2100', 'mean', 'light'].  
           'rec601'  - Rec.ITU-R BT.601-7  
           'itu709'  - ITU-R BT.709  
           'itu2100' - ITU-R BT.2100  
           'mean'    - calculate mean of rgb  
           'light'   -  the average of the maximum and minimum values of rgb.  
           
Output: gray
