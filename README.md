

# CODES FIELDS (extendable 0-255):
> [!NOTE]
> `E_` for errors

> [!IMPORTANT]
> EVERY CODE IS CODED ON ONE BYTE ONLY

> [!IMPORTANT]
> Receiving an code with the same code sent is considered a successful request


## 01 - 09: CONNECTIONS MANAGEMENT
        CONNECTION ---------------------- 1
        DISCONNECTION ------------------- 2
        E_TOO_MANY_CLIENTS -------------- 3

## 10 - 19: ACCOUNTS ACTIONS 
        LOGIN --------------------------- 10 + login struct following, on [32B | 32B]
        SIGNUP -------------------------- 11 + login struct following, on [32B | 32B]
        LOGOUT -------------------------- 12
        E_INVALID_U_OR_P ---------------- 13
        E_U_ALREADY_EXISTS -------------- 14
        E_U_TOO_LONG -------------------- 15
        E_P_NOT_SAFE -------------------- 16

## 20 - 29: MENUS ACTIONS
        JOIN_GAME_RANDOM ---------------- 20 + game mode [1B]
        JOIN_GAME_WITH_CODE ------------- 21 + game code [8B]
        CREATE_GAME --------------------- 22 + game info []
        LEAVE_GAME ---------------------- 23


## 30 - 39: IN-GAME ACTIONS 
q       MOVEMENT ------------------------ 30 + is Up key pressed [1B] (0 false | 1 true)
b       MAP ----------------------------- 31 [int H | int W | ["_________c________e____", "_________c________e____"]]
b       SPEED --------------------------- 32 [int S]
b       POS ----------------------------- 33 [int H | int W]
q       ASK_PAUSE ----------------------- 35
        E_NO_PAUSE ---------------------- 36

## Obstacles: e = electric obstacles; c = coin

## Positions: pourcentages float x + float y -> 0-100
