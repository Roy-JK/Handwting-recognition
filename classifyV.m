function centerX = classifyV(V)
thre = 0.1;
disThre = 25;

tmsp = find(abs(V) < thre);
beg = 1;
cnt = 1;
for i = 2 : length(tmsp)
    if tmsp(i) - tmsp(i - 1) >= disThre
        centerX(cnt) = floor(mean(tmsp(beg : i - 1)));
        beg = i;
        cnt = cnt + 1;
    end
end
centerX(cnt) = floor(mean(tmsp(beg : length(tmsp))));