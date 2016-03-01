//---------------------------------------------------LEVEL3---------------------------------------------------

    //--------------- MOTD / SUDO MOTD ---------------\\
if (keyboard_string = ">motd")||(keyboard_string = ">sudo motd")
    {
       txt+=scrColorflag(c_white)+"
 You neeed move to another computer to use databse.
 Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"ssh wilterk "+scrEndColorflag()+
        scrColorflag(c_white)+"to move to wilterk´s computer "+scrEndColorflag()+ "

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
        ssh"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Move to another computer"+scrEndColorflag()+  
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
        scrColorflag(c_white)+" - Display file content
        
        Type your"+scrEndColorflag()+scrEndColorflag()+
        scrColorflag(c_yellow)+" command "+scrEndColorflag()+
        scrColorflag(c_white)+"below and press enter to execute it.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
    }

    //--------------- SSH / SUDO SSH ---------------\\
else if (keyboard_string = ">ssh")||(keyboard_string = ">sudo ssh")
    {
        txt+=scrColorflag(c_red)+"
        You must specify a computer"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"ssh "+scrEndColorflag()+scrColorflag(c_yellow)+"computer
        
"
+scrEndColorflag();
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
else if (keyboard_string = ">ls")||(keyboard_string = "> sudo ls")
    {
        txt+=scrColorflag(c_aqua)+"
        motd.bin"+scrEndColorflag()+scrColorflag(c_gray)+"
        wilterk.mail
        birthday.jpeg
        wWw.jpeg

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

    //--------------- SSH WILTERK / SUDO SSH WILTERK ---------------\\
else if (keyboard_string = ">ssh wilterk")||(keyboard_string = ">sudo ssh wilterk")
    {
        txt+="
        "
        keyboard_string = "date_of_birth(dd/mm/yy)? ";
        inputText = keyboard_string;
        exit
    }

//------------------------------------------- KOMBINOVANÁ SEKCE -------------------------------------------\\        

str        = keyboard_string; 
splitArray = ds_list_create();
actualWord = "";

//---------- CÍLE ----------\\  
target[0]  = ">cat"; target[1] = "birthday.jpeg"; target[2] = "motd.bin"; target[3] = "wilterk.mail"; target[10] ="wWw.jpeg";
target[4]  = "date_of_birth(dd/mm/yy)?"; target[5]  = "05/11/85";
target[6]  = ">ssh"; target[7]  = "wilterk"; 
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

//---------- 2. SLOVO = BIRTHDAY.JPEG (CAT BIRTHDAY.JPEG) ----------\\   
if (splitArray[| 1] = target[1])
{
txt+= scrColorflag(c_red)+"
       This file must be open as administrator
       
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 2. SLOVO = WWW.JPEG (CAT WWW.JPEG) ----------\\   
if (splitArray[| 1] = target[10])
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
 You neeed move to another computer to use databse.
 Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"ssh wilterk "+scrEndColorflag()+
        scrColorflag(c_white)+"to move to wilterk´s computer "+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 2. SLOVO = WILTERK.MAIL (CAT WILTERK.MAIL) ----------\\  
else if (splitArray[| 1] = target[3])
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


//---------- 1. SLOVO = date_of_birth(dd/mm/yy)? ----------\\  
if (splitArray[| 0] = target[4])
{

//---------- 2. SLOVO = 05/11/85 (date_of_birth(dd/mm/yy)? 05/11/85)----------\\  
if (splitArray[| 1] = target[5])
{
txt+=scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}

//---------- NESPRÁVNÉ DATUM (date_of_birth(dd/mm/yy)? *****)----------\\  
else
{
txt+=scrColorflag(c_red)+"
        Wrong date, access denied.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}
exit
}

//---------- 1. SLOVO = SSH (SHH .....)----------\\  
if (splitArray[| 0] = target[6])
{

//---------- 2. SLOVO = WILTERK (SSH WILTERK)----------\\  
//TOHLE BY SE MĚLO VYŘEŠIT JIŽ DŘÍVE (DEBUG)
if (splitArray[| 1] = target[7])
{
txt += scrColorflag(c_red)+"
        Eroor

"+scrEndColorflag();
txt+="
        Eroor

";
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}

//---------- NEZNÁMÝ POČÍTAČ (SSH *****)----------\\  
else
{
txt+=scrColorflag(c_red)+"
        Unknow computer '" +splitArray[| 1]+"'

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

//---------- 3. SLOVO = BIRTHDAY.JPEG (SUDO CAT BIRTHDAY.JPEG)----------\\
if (splitArray[| 2] = target[1])
{
with(pictures){instance_destroy()}
instance_create(700,0,oCake)
txt+=scrColorflag(c_gray)+"
        Picture was shown in another terminal
        Press Escape to close it.
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

//---------- 3. SLOVO = WWW.JPEG (SUDO CAT WWW.JPEG)----------\\
if (splitArray[| 2] = target[10])
{
with(pictures){instance_destroy()}
instance_create(700,0,oWww)
txt+=scrColorflag(c_gray)+"
        Picture was shown in another terminal
        Press Escape to close it.
        
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 3. SLOVO = WILTERK.MAIL (SUDO CAT WILTERK.MAIL)----------\\
else if (splitArray[| 2] = target[3])
{
txt+=scrColorflag(c_white)+"
        Sent the 05/11/15 6:28 AM <wilterk@mail.com> wrote:
        
        Hey Danny,
        
        Tonight´s is Daniels birthday party. 
        We bought a gift, everyone should give $5.
        
        See you tonight
        
        Will

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 3. SLOVO = MOTD.BIN (SUDO CAT MOTD.BIN)----------\\
else if (splitArray[| 2] = target[2])
{
txt+=scrColorflag(c_white)+"
 You neeed move to another computer to use databse.
 Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"ssh wilterk "+scrEndColorflag()+
        scrColorflag(c_white)+"to move to wilterk´s computer "+scrEndColorflag()+ "

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
        Command does not exists or this command can not run as administrator."+scrColorflag(c_gray)+"
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
