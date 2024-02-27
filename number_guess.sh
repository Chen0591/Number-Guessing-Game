#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# 随机生成一个1到1000之间的数字作为秘密数字  
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))  
# 检查是否有用户名输入  
if [ -z "$1" ]; then  
    echo "Enter your username:"  
    read USERNAME  
else  
    USERNAME="$1"  
fi  
# 检查用户名是否存在  
USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME';")
if [[ -z $USER ]]
 then  
    # 用户名不存在，添加新用户  
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');") 
    echo "Welcome, $USERNAME! It looks like this is your first time here."  
else  
    # 用户名存在，获取用户信息  
    USER_INFO=$($PSQL "SELECT games_played,best_game FROM users WHERE username='$USERNAME';") 
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';") 
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")  
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."  
fi  
# 开始猜数字游戏  
echo "Guess the secret number between 1 and 1000:"  
GUESSES=0
while true; do
    ((GUESSES++))
    read GUESS  
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then  
        echo "That is not an integer, guess again:"  
        continue  
    fi  
    if (( GUESS < SECRET_NUMBER )); then  
        echo "It's higher than that, guess again:"  
    elif (( GUESS > SECRET_NUMBER )); then  
        echo "It's lower than that, guess again:"  
    else  
        # 猜对了  
        echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"  
        # 更新用户信息  
        UPDATE_INFO=$($PSQL "UPDATE users SET games_played=(games_played+1),best_game=LEAST(best_game,$GUESSES) WHERE username='$USERNAME';")  
        break  
    fi  
done