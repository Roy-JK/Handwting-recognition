function combine(filename,type) %���� .combine  % filename='B6';
%%  Ŀ�꣺ ����xx.combine ,����C#д�õĳ�����ʵ�ֺϲ���ĿǰC#����ʵ�ֵĹ��ܣ�xx.data->xx.combine
system(['C:\�ҵ��ĵ�\Work\�ϲ�����\�ϲ�����\bin\Debug\CombineData.exe ',filename,' ',type]);

disp([filename,'.combine has done.'])
end
