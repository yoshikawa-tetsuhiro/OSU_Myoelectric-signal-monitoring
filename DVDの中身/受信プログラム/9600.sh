#設定変更時のコマンド
#sudo cu -s 9600 -l /dev/rfcomm1
#以下のコマンドを実行 
    sudo rfcomm
    sudo rfcomm release /dev/rfcomm1
    sudo rfcomm
    sudo rfcomm bind 1 60:8A:10:62:7E:D6
    sudo chmod 666 /dev/rfcomm1 
    cat /dev/rfcomm1 | sudo sqlite3 /opt/sqlite/tool/test4.db
