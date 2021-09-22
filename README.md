yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=./metadata.yaml --ssh-key ~/.ssh/id_rsa.pub

testapp_IP = 130.193.43.80
testapp_port = 9292

testapp_IP = 130.193.49.61
testapp_port = 9292


Домашнее задание №12 Ansible роли, управление настройками нескольких окружений и best practices
1) Перенос плейбуков в раздельные роли
Создадим роли app и db, а также используем коммьюнити роль nginx для настройки обратного прокси нашего приложения на 80й порт. Для генерации структуры каталогов с файлами роли воспользуемся командой ansible-galaxy init

$ ansible-galaxy init app
$ ansible-galaxy init db
2) Управление окружениями prod и stage с помощью Ansible
В ansible.cfg по умолчанию указывается окружение stage. Для запуска окружения prod ипользуется:

ansible-playbook -i environments/prod/inventory deploy.yml

3) Взаимодействие с Community-ролями
Воспользуемся ролью jdauphant.nginx и с помощью nginx произведём настройку обратного проксирования для приложения. Установка роли выполняется через файл зависимости:

ansible-galaxy install -r environments/stage/requirements.yml

4) Ansible Vault
В ansible.cfg указывается расположение ключа шифрования вне репозитория.

vault_password_file = ~/.ansible/vault.key

Запуск плейбука site.yml, инициирует запуск плейбука user.yml, который был создан в ходе работы, что позволит доюавить пользователей admin и qauser для хостов stage окружения. Для активации доступа по логину/паролю, требуется изменить настройки sshd на PasswordAuthentication yes и перезапустить sshd.
