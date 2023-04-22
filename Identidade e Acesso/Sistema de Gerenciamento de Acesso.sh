#!/bin/bash
clear

login () {
    read -p "Login: " user;
    read -p "Senha: " pass;
    if [ -z $pass ]; then
        echo -e "\nA senha não pode estar vazia!"
        login;
    elif [ "$pass" -eq "321" ]; then
        echo -e "\nSenha incorreta!"
        login;
    else
        menu;
    fi
}


menu (){
    echo -e "\n\n"
    echo "    Bem vindo de volta $user    "
    echo "--------------------------------"
    echo "             MENU"
    echo "--------------------------------"
    echo " ( 1 ) Identificar usuário......"
    echo " ( 2 ) Criar um usuário........."
    echo " ( 3 ) Apagar um usuário........"
    echo " ( 4 ) Sair....................."
    echo "--------------------------------"
    echo -e "\n\n"
    read -p "Informe a opção desejada: " option;
    case $option in
        1) id_user ;;
        2) new_user ;;
        3) rm_user ;;
        4) quit ;;
        *) echo "Ops! Essa opção não existe! Acesse novamente."; 
          sleep 4;
          exit ;;
    esac
}


id_user (){
    echo -e "----------IDENTIFICAR USUÁRIO-\n"
    read -p "Insira o nome do usuário que deseja pesquisar: " id_user;
        if [ -z "$id_user" ]; then 
            echo "O nome não pode ser vazio!\n"
            id_user;
        fi
    valid=$(grep -c "^$id_user:" /etc/passwd)
        if [[ $valid -eq 1 ]]; then 
            echo -e "\n"
            id "$id_user"
            echo -e "\n"
            finger "$id_user"
            menu;
        else 
            echo -e "O usuário informado não existe!\n"
            echo -e "Se deseja criar um novo usuário siga:\n"
            echo -e "Menu > ( 2 ) Criar um usuário"
        fi
}

new_user(){
    echo -e "---------------NOVO USUÁRIO-\n"
    read -p "Insira o nome de usuário que deseja adicionar: " new_user;
    if [ -z "$new_user" ]; then
        echo -e "Ops! O nome não pode estar vazio!\n"
        new_user;
    elif [ "$new_user" = "$user" ]; then
        echo -e "O nome não pode ser o seu\n"
        new_user;
    elif [ "$new_user" = "root" ]; then
        echo -e "Ops! O usuário não pode ser o administrador do sistema!"
        new_user;
    else 
        useradd -d /home/$new_user $new_user
        passwd $new_user
        echo -e "\nUsuário foi criado com sucesso!\n"
        menu;
    fi
}

rm_user(){
    echo -e "-------------REMOVER USUÁRIO-\n"
    echo "*ATENÇÃO* -> A remoção é feita de forma definitiva"
    read -p "Insira o nome do usuário que deseja remover: " rm_user;
        if [ -z $rm_user ]; then
            echo -e "O nome não pode estar vazio!\n"
            rm_user;
        elif [ $rm_user = $user ]; then
            echo -e "Você não pode remover o próprio usuário\n"
            rm_user;
        elif [ $rm_user = "root" ]; then
            echo -e "Você não pode remover a conta de administração do sistema\n"
            rm_user;
        else 
            valid_rmv=$(grep -c "^$rm_user:" /etc/passwd)
            if [[ $valid_rmv -gt 0 ]]; then 
                userdel $rm_user
                rm -rf /home/$rm_user
                echo -e "O usuário $rm_user foi excluído com sucesso\n"
            else 
                echo -e "O usuário $rm_user não está cadastrado no sistema!\n"
                menu;
            fi
        fi
}

quit () {
    read -p "Deseja encerrar o sistema? (SIM - 1) (NÃO - 2)" quitar;
        if [ -z $quitar ]; then
            echo -e "Ih, seleção inválida! Encerrando o sistema...\n"
            exit;
        elif [ $quitar -eq 1 ]; then
            echo -e "Até logo!\n"
            exit;
        elif [ $quitar -eq 2 ]; then
            echo -e "Retornando ao menu inicial\n"
            menu;
        else 
            echo -e "Ih, seleção inválida! Encerrando o sistema...\n"
            exit;
        fi
}

login
