function combine(filename,type) %生成 .combine  % filename='B6';
%%  目标： 生成xx.combine ,调用C#写好的程序来实现合并。目前C#程序实现的功能：xx.data->xx.combine
system(['C:\我的文档\Work\合并数据\合并数据\bin\Debug\CombineData.exe ',filename,' ',type]);

disp([filename,'.combine has done.'])
end

