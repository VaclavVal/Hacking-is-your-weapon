//---------------------------------------------------LEVEL3---------------------------------------------------

    //--------------- MOTD / SUDO MOTD ---------------\\
if (keyboard_string = ">motd")||(keyboard_string = ">sudo motd")
    {
       txt+=scrColorflag(c_white)+"
    Forgotten your password? Look on your encrypted password in your computer.
    Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"sudo "+scrEndColorflag()+
        scrColorflag(c_white)+"to use command as administrator "+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

    //--------------- HELP / SUDO HELP ---------------\\
else if (keyboard_string = ">help")||(keyboard_string = ">sudo help")
    {
        txt+=scrColorflag(c_yellow)+"
        motd"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display the last system message"+scrEndColorflag()+ 
        scrColorflag(c_yellow)+"
        sudo"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Use"+scrEndColorflag()+ scrColorflag(c_yellow)+" command "+scrEndColorflag()+ scrColorflag(c_white)+"as andministrator"+scrEndColorflag()+ 
        scrColorflag(c_yellow)+"
        ls"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - List files"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        help"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display tihs help"+scrEndColorflag()+
        scrColorflag(c_yellow)+"
        cat"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display file content"+scrEndColorflag()+
        scrColorflag(c_yellow)+"
        login"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Login on the system"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        
        Type your"+scrEndColorflag()+scrEndColorflag()+
        scrColorflag(c_yellow)+" command "+scrEndColorflag()+
        scrColorflag(c_white)+"below and press enter to execute it.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
    }

    //--------------- SUDO ---------------\\
else if keyboard_string = ">sudo"
    {
        txt+=scrColorflag(c_red)+"
        You must specify a command"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"sudo "+scrEndColorflag()+scrColorflag(c_yellow)+"command
        
"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}    
    
    //--------------- LS / SUDO LS ---------------\\
else if (keyboard_string = ">ls")||(keyboard_string = ">sudo ls")
    {
        txt+=scrColorflag(c_aqua)+"
        motd.bin"+scrEndColorflag()+scrColorflag(c_gray)+"
        system.bin
        aevans.mail
        ASCII.jpeg
        

"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

    //--------------- CAT / SUDO CAT ---------------\\
else if (keyboard_string = ">cat") ||(keyboard_string = ">sudo cat")
    {
        txt+=scrColorflag(c_red)+"
        You must specify a file to display"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"cat "+scrEndColorflag()+scrColorflag(c_aqua)+"filename
        
"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}


    //--------------- LOGIN / SUDO LOGIN---------------\\
    else if (keyboard_string = ">login")||(keyboard_string = ">sudo login")
    {
        txt+="
        "
        keyboard_string = "password? ";
        inputText = keyboard_string;
        exit
    }

//------------------------------------------- KOMBINOVANÁ SEKCE -------------------------------------------\\        

str        = keyboard_string; 
splitArray = ds_list_create();
actualWord = "";

//---------- CÍLE ----------\\  
target[0]  = ">cat"; target[1] = "ASCII.jpeg"; target[2] = "motd.bin"; target[3] = "aevans.mail"; target[10] = "system.bin";
target[4]  = "password?"; target[5]  = "Pa55word";
target[8]  = ">sudo"; target[9]  = "cat";
pass       = true;

//---------- SYSTÉM ----------\\ 
str = str + " ";
for (i = 1; i <= string_length(str); i++)
    {
     if (string_char_at(str,i) == chr(32)) 
        {
         ds_list_add(splitArray,actualWord);
         actualWord = "";
        }
     else
         {
           actualWord += string_char_at(str,i);
         }
    
    }
//---------- PODMÍNKY ----------\\ 
  
//---------- 1. SLOVO = CAT -----------\\       
if (splitArray[| 0] = target[0])
{

//---------- 2. SLOVO = BIRTHDAY.JPEG (CAT ASCII.jpeg) ----------\\   
if (splitArray[| 1] = target[1])
{
txt+= scrColorflag(c_red)+"
       This file must be open as administrator
       
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}
//---------- 2. SLOVO = MOTD.BIN (CAT MOTD.BIN) ----------\\  
else if (splitArray[| 1] = target[2])
{
txt+=scrColorflag(c_white)+"
    Forgotten your password? Look on your encrypted password in your computer.
    Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"sudo "+scrEndColorflag()+
        scrColorflag(c_white)+"to use command as administrator "+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 2. SLOVO = WILTERK.MAIL (CAT AEVANS.MAIL) ----------\\  
else if (splitArray[| 1] = target[3])
{
txt+=scrColorflag(c_red)+" 
        This file must be open as administrator
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 2. SLOVO = SYSTEM.BIN (CAT SYSTEM.BIN) ----------\\  
else if (splitArray[| 1] = target[10])
{
txt+=scrColorflag(c_red)+" 
        This file must be open as administrator
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- NESPRÁVNÝ SOUBOR (CAT *****)----------\\  
else
{
txt+=scrColorflag(c_red)+"
        Unknow file '" +splitArray[| 1]+"'

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}
exit
}


//---------- 1. SLOVO = PASSWORD? ----------\\  
if (splitArray[| 0] = target[4])
{

//---------- 2. SLOVO = Pa55word (password? Pa55word) ----------\\  
if (splitArray[| 1] = target[5])
{
txt+=scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}

//---------- NESPRÁVNÉ HESLO(PASSWORD? *****)----------\\  
else
{
txt+=scrColorflag(c_red)+"
        Wrong password, access denied.
        Forgotten your password? Look on your encrypted password in your computer.
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}
exit
}



//---------- 1. SLOVO = SUDO (SUDO ...)----------\\
if (splitArray[| 0] = target[8])
{

//---------- 2. SLOVO = CAT (SUDO CAT ...)----------\\
if (splitArray[| 1] = target[9])
{

//---------- 3. SLOVO = ASCII.jpeg (SUDO CAT ASCII.jpeg)----------\\
if (splitArray[| 2] = target[1])
{
with(pictures){instance_destroy()}
instance_create(700,0,oAscii)
txt+=scrColorflag(c_gray)+"
        Picture was shown in another terminal
        Press Escape to close it.
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 3. SLOVO = AEVANS.MAIL (SUDO CAT AEVANS.MAIL)----------\\
else if (splitArray[| 2] = target[3])
{
txt+=scrColorflag(c_white)+"
        Sent the 04/10/14 8:38 PM <aevans@complex.com> wrote:
        
        Hey bro,
        I sent you your encrypted password. (you know - BIN  -> ASCII -> Lat. Alph.)
        
        A.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 3. SLOVO = MOTD.BIN (SUDO CAT MOTD.BIN)----------\\
else if (splitArray[| 2] = target[2])
{
txt+=scrColorflag(c_white)+"
    Forgotten your password? Look on your encrypted password in your computer.
    Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"sudo "+scrEndColorflag()+
        scrColorflag(c_white)+"to use command as administrator "+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 3. SLOVO = SYSTEM.BIN (SUDO CAT SYSTEM.BIN)----------\\
else if (splitArray[| 2] = target[10])
{
txt+=scrColorflag(c_gray)+"
    10 10 00 0 
    11 00 00 1 
    11 01 01 
    11 01 01 
    11 10 11 1 
    11 01 11 1 
    11 10 01 0 
    11 00 10 0

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}


//---------- NEZNÁMÝ SOUBOR (SUDO CAT *****)----------\\
else
{
txt+=scrColorflag(c_red)+"
        File does not exists."+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"sudo cat "+scrEndColorflag()+scrColorflag(c_gray)+"filename
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}
exit
}

else
{


//---------- NEZNÁMÝ PŘÍKAZ (SUDO *****)----------\\
txt+=scrColorflag(c_red)+"
        Command does not exists"+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"sudo "+scrEndColorflag()+scrColorflag(c_yellow)+"command
        
"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}
}

//---------- NEZNÁMÝ PŘÍKAZ (*****)----------\\
txt+=scrColorflag(c_red)+"
        command not found."+scrEndColorflag()+
        scrColorflag(c_white) +" Use " +scrEndColorflag()+
        scrColorflag(c_yellow)+"help "+scrEndColorflag()+
        scrColorflag(c_white)+"to list available " +scrEndColorflag()+
        scrColorflag(c_yellow)+"commands"+"."+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;   
