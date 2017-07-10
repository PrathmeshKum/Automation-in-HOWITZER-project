for n=1:1:3;
    
    range=[2 4 7 3];
    q=length(range);
    
    wind(1:q)=n;
    wind1{n}=wind;
    clear wind
    range1{n}=range;    
    
end

wind2=cell2mat(wind1);
range2=cell2mat(range1);