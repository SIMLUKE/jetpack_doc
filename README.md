# Jetpack project documentation
change this text file to markdown for better reading experience

---

# SENDING CODES
Every code (1 ... 255) is on ONE BYTE only

## Client codes to server

### x01 ... x09 → base codes
```
002   DISCONNEXION
```

### x10 ... x19 → accounts codes
```
010  LOGIN   (10 + [32 bytes username + 32 bytes password])
011  SIGNUP  (11 + [32 bytes username + 32 bytes password])
012  LOGOUT
```

### 20 ... 29 → menus codes
```
020  JOIN_RANDOM_GAME
021  JOIN_RANDOM_GAME_WITH_MODE  (21 + [1 bytes game_mode])                      {bonus}
022  JOIN_GAME_WITH_CODE         (22 + [8 bytes game_code])                      {bonus}
023  CREATE_GAME                 (23 + [1 byte nb_players + 1 byte game_mode])   {bonus}
024  LEAVE_LOBBY
```

### 30 ... 39 → in_game codes
```
31  MOVEMENT (30 + [1B actions (every bind is a bit of the byte)])               [infos]
35  ASK_PAUSE                                                                    {bonus}
```

## Server codes to client


### 01 ... 09 → base codes
```
1   CONNEXION_OK
3   E_TOO_MANY_CLIENTS
4   E_INCORRECT_CODE
5   E_INCORRECT_FOLLOWING_DATA_SIZE
```

### 10 ... 19 → accounts codes
```
13  E_INVALID_USER_OR_PASSWORD
14  E_USER_ALREADY_EXISTS
15  E_INCORRECT_USER_FORMAT
16  E_PASSWORD_NOT_SAFE
17  E_U_ALREADY_LOGGED
18  E_U_NOT_LOGGED_IN
19  LOGGED_IN
```

### 20 ... 29 → menus codes
```
25  GAME_JOINED
26  LOBBY_LEFT
```

### 30 ... 39 → in_game codes
```
30  GAME_STARTING
32  GAME_DATA   (32 + [4B game_status + 4B coins + 4B x_pos + 4B y_pos])
33  MAP_DATA    (33 + [4B map_witdth + 4B map_height + ?B chunk])                [infos]
36  GAME_PAUSED                                                                  {bonus}
```

# [infos] Complementary informations on  sent data

### Code 31 : Movement

Every bit of the action byte is one eventually useful event for the client to send to the server.

```
2⁰ = space
2¹ = arrow_up
2² = arrow_down
2³ = arrow_left
2⁴ = arrow_right
2⁵ = enter
2⁶ = z
2⁷ = e
```

Example:

`0000 0001` = only space is pressed

`1000 0001` = space and e are pressed

### Code 33 : Map Data

Map data COULD be variable size, so we need a way to know its size.
We will use 2 integers to know the chunk width and height.

```
4B width
4B height
(width*height)B chunk
```

Example :

We will send the chunk presented below:

```
eeee
____
c___
```
it is 4 characters long and 3 characters tall

The output sent by the server will be:

```
33 -> code
00 00 00 04     -> chunk width
00 00 00 03     -> chunk height
101 101 101 101 -> first chunk line
95 95 95 95     -> second chunk line
99 95 95 95     -> third chunk line
```

Which will give the following packet :
```
[33, 00, 00, 00, 04, 00, 00, 00, 03, 101, 101, 101, 101, 95, 95, 95, 95, 99, 95, 95, 95]
```
