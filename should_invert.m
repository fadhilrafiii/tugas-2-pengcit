function result = should_invert(BW)
    white_count = sum(BW == 1, 'all');
    result = white_count > numel(BW)/2;
end
