

# CODES FIELDS (extendable 0-255):
> [!NOTE]
> `E_` for errors

> [!IMPORTANT]
> EVERY CODE IS CODED ON ONE BYTE ONLY

> [!IMPORTANT]
> Receiving an code with the same code sent is considered a successful request


## 01 - 09: CONNECTIONS MANAGEMENT
```
```
        CONNECTION ---------------------- 1
        DISCONNECTION ------------------- 2
        E_TOO_MANY_CLIENTS -------------- 3
```
```

## 10 - 19: ACCOUNTS ACTIONS 
```
        LOGIN --------------------------- 10 + login struct following, on [struct login size bytes]
        SIGNUP -------------------------- 11 + login struct following, on [struct login size bytes]
        LOGOUT -------------------------- 12
        E_INVALID_U_OR_P ---------------- 13
        E_U_ALREADY_EXISTS -------------- 14
        E_U_TOO_LONG -------------------- 15
        E_P_NOT_SAFE -------------------- 16
```

## 20 - 29: MENUS ACTIONS 
```
```
        JOIN_GAME_RANDOM ---------------- 20 + game mode selected on 1 byte
        JOIN_GAME_WITH_CODE ------------- 21 + game code following on 8 bytes
        CREATE_GAME --------------------- 22 + game struct following, coded on [struct game size] bytes
        LEAVE_GAME ---------------------- 23
```
```

## 30 - 39: IN-GAME ACTIONS 
```
```
        MOVEMENT ------------------------ 30 + direction the player is going in, on 1 byte
        ASK_PAUSE ----------------------- 35
```
```



