function p = plotMediaTimecourse(table,metnames,logscale)
%PLOTMEDIATIMECOURSE(table,{metnames},[logscale]) create a line plot of the total 
%amount of the specified metabolites. 
%The first argument should be a data table loaded through parseMediaLog.m
if nargin < 3
    logscale = false;
end

if ischar(metnames) %if given one metabolite to plot
    metnames = {metnames};
end

x = unique(table.t);
y = zeros(length(x),length(metnames));

ncells = max(table.x) * max(table.y);
for i = 1:length(metnames)
    met = metnames{i};
    st = table(strcmp(met,table.metname),:);
    
    %sum all cells at the same timepoint
    amt = reshape(st.amt,length(x),ncells);
    amt = sum(amt,2);
    
    y(:,i) = amt;
end

if logscale
    y = log10(y);
end

p = plot(x,y);
legend(metnames,'location','best','Interpreter', 'none');

end
