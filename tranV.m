function answer=tranV(a,j,tt)   %��� Vj��a�Ǽ��ٶ����У�tt��ʱ����
    answer=0;
    for i=1:j-1
        answer=answer+tt*a(i);
    end
end