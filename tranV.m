function answer=tranV(a,j,tt)   %输出 Vj，a是加速度序列，tt是时间间隔
    answer=0;
    for i=1:j-1
        answer=answer+tt*a(i);
    end
end