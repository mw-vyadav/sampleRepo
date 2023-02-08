classdef Door < handle
    
    properties (SetAccess = private)
        IsOpen (1, 1) logical = false;
        Color (1, 3) double = [1 0 0];
    end

    methods
        function open(obj)
            obj.IsOpen = true;
        end

        function close(obj)
            obj.IsOpen = false;
        end

        function paint(obj, color)
            obj.Color = validatecolor(color);
        end
    end

end
