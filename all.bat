adb -s 127.0.0.1:4444  pull /sdcard/111.data ./DATA/ST.data
ping 127.0.0.1 -n 3
cd C:\ÎÒµÄÎÄµµ\Work\Android SDK\platform-tools-backup
matlab -nojvm -nodesktop -nodisplay -nosplash -r Maintest
ping 127.0.0.1 -n 15
cd LSTM
python lstm.py
matlab -nojvm -nodesktop -nodisplay -nosplash -r getAlphaSeq
cd ..
