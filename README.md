# My-Neovim-config-in-LUA
I have written my own neovim config file in lua, learning each day............

Transition from Vimscript to Lua seems a little different due to better folder structure and file management as in any programming language.Will be updating this whenever I find something new or errorneous.

## Inspired from 🙏🏼👀 

#### [Michael Paulson](https://github.com/ThePrimeagen)

![images](https://github.com/JoydeepMallick/My-Neovim-config-in-LUA/assets/94801952/f0ee1da2-f33d-4a8b-a2dc-0ec8a80e5080)


#### [Takuya Matsuyama](https://github.com/craftzdog)

![p0kzmQhD_400x400](https://github.com/JoydeepMallick/My-Neovim-config-in-LUA/assets/94801952/8b59c107-e80b-44f9-98b8-832a69b67439)




## Few screenshots of my current neovim configuration(running neovim in Windows terminal)

![Screenshot (499)](https://user-images.githubusercontent.com/94801952/222431078-0d3abdda-2a69-4a7a-9dd7-1babc2db3258.png)

![Screenshot (498)](https://user-images.githubusercontent.com/94801952/222431141-953df07f-dce3-4b1a-8cdd-8a3bd2312c09.png)


## Note :-
1. Do not simply copy the codebase entirely as this has some settings which are just for my own personal computer, I have tried to comment each code block with its function as much as possible so please read it carefully.
2. This has been made considering Windows 10 user using neovim and shell by default is cmd, few functionalities to implement in powershell don't work as intended so commented out as of now.


### ⚠One major problem in Neovim terminal when executing an exe file is that pasting Multiple lines in that exe file will simply concatenate them to one line causing errorneous output (this is mostly intended for user input after executing file when you want to paste the input instead of typing, ignore and update those remaps accordingly.)

i.e.   copied block of code
```        
2
2  3
asd
4  4
qwer
```    

upon pasting in that exe file via Neovim terminal i.e when we execute below command and then in the integrated terminal paste copied text using p in normal mode or middle-mouseclick or right-click and paste

```vim
:term a.exe 
```

on the terminal following can be seen which is unexpected :-
```        
22  3asd4  4qwer
```

### ⚒ A workarround I found out is to use an input file and make it seem to user as if we are entering data into terminal by inserting most recent copied data in register into input file and then passing it our code. This can be found in my [keymaps.lua](https://github.com/JoydeepMallick/My-Neovim-config-in-LUA/blob/main/lua/keymaps.lua) file.
        
Suggestions and improvement are welcomed.
